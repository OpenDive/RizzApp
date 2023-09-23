// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "./dependencies/ERC1155.sol";
import "./dependencies/Ownable.sol";
import "./dependencies/Pausable.sol";
import "./dependencies/ERC1155Burnable.sol";
import "./dependencies/ERC1155Supply.sol";
import "./dependencies/MerkleProof.sol";
import "./dependencies/ECDSA.sol";

/**
 * @title Rizz Multi-Collection NFT with pausable transfers

 *
 *  - Owner can pause or unpause NFT transfers.
 *  - Adjustable metadata.
 *  - Create multiple NFT collections with the same contract.
 *
 */
interface URIResolver {
    function tokenURI(uint256 id) external view returns (string memory);
}

contract RizzaERC1155 is ERC1155, ERC1155Supply {
    using ECDSA for bytes32;

    constructor() payable ERC1155("") {}

    string version = "V0";

    mapping(uint256 => bool) public soulbound;
    mapping(uint256 => string) public uris;
    mapping(uint256 => address) public resolver;
    mapping(address => uint256) public nonces;
    mapping(uint256 => uint256) public remaining_mints;
    mapping(uint256 => uint256) public expiration;
    mapping(uint256 => bytes32) public merkle_roots;
    mapping(uint256 => address) public proxyminter;
    mapping(uint256 => address) public admins;
    mapping(uint256 => mapping(address => bool)) reedemed;
    struct Config {
        uint256 _limit;
        bool _soulbound;
        bytes32 _merkleroot;
        address _resolver;
        string _metadata;
        uint256 _expiration;
        address _proxyminter;
        address _admin;
    }

    function getContractHash() public view returns (bytes32) {
        return keccak256(abi.encode(version, block.chainid, address(this)));
    }

    function createMint(Config memory c) public {
        uint256 id = generateID(msg.sender, nonces[msg.sender]);
        nonces[msg.sender]++;
        if (c._resolver != address(0)) {
            resolver[id] = c._resolver;
        } else {
            require(bytes(c._metadata).length > 0, "empty uri string");
            uris[id] = c._metadata;
        }
        if (c._expiration > 0) {
            expiration[id] = c._expiration;
        }
        merkle_roots[id] = c._merkleroot;
        remaining_mints[id] = c._limit;
        proxyminter[id] = c._proxyminter;
        expiration[id] = c._expiration;
        admins[id] = c._admin;
        soulbound[id] = c._soulbound;
    }

    function generateID(address a, uint256 n) internal pure returns (uint256) {
        return
            uint256(uint160(uint256(keccak256(abi.encode(a))))) * 10 ** 9 + n;
    }

    function uri(
        uint256 id
    ) public view virtual override returns (string memory) {
        if (resolver[id] != address(0)) {
            return URIResolver(resolver[id]).tokenURI(id);
        } else {
            return uris[id];
        }
    }

    function reedem_mint(
        address receiver,
        uint256 id,
        bytes memory sig,
        bytes32[] calldata proof
    ) external {
        address signer = recover_signer(receiver, id, sig);
        require(
            verify_proof(signer, merkle_roots[id], proof),
            "invalid signer"
        );
        require(reedemed[id][receiver] == false, "code has been used");
        require(remaining_mints[id] >= 1, "no mints left");
        remaining_mints[id] -= 1;
        reedemed[id][receiver] = true;
        _mint(receiver, id, 1, "");
    }

    function verify_proof(
        address a,
        bytes32 merkleroot,
        bytes32[] calldata proof
    ) internal pure returns (bool) {
        bytes32 leaf = keccak256(abi.encodePacked(a));
        return MerkleProof.verifyCalldata(proof, merkleroot, leaf);
    }

    function recover_signer(
        address receiver,
        uint256 id,
        bytes memory sig
    ) internal view returns (address) {
        hashMint(receiver, id).toEthSignedMessageHash().recover(sig);
        return address(0);
    }

    function hashMint(
        address receiver,
        uint256 id
    ) internal view returns (bytes32) {
        return keccak256(abi.encode(getContractHash(), receiver, id));
    }

    function admint_mint_update(
        uint256 id,
        uint256 _limit,
        bytes32 _root
    ) external {
        require(msg.sender == admins[id], "user must be admin");
        merkle_roots[id] = _root;
        remaining_mints[id] = _limit;
    }

    function mint_through_trusted_proxy(address receiver, uint256 id) external {
        require(proxyminter[id] == msg.sender, "only proxy minter");
        require(remaining_mints[id] >= 1, "no mints left");

        remaining_mints[id] -= 1;
        _mint(receiver, id, 1, "");
    }

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override(ERC1155, ERC1155Supply) {
        for (uint i = 0; i < ids.length; i++) {
            require(!soulbound[ids[i]], "nft is locked");
        }
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
