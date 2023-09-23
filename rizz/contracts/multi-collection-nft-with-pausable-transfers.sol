/*

 ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██    ██████  ███████ ██    ██
██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██      ██    ██
██      ██    ██ ██    ██ █████   ██████  ██    ██ ██    ██ █████      ██   ██ █████   ██    ██
██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██       ██  ██
 ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██ ██ ██████  ███████   ████

Find any smart contract, and build your project faster: https://www.cookbook.dev
Twitter: https://twitter.com/cookbook_dev
Discord: https://discord.gg/WzsfPcfHrk

Find this contract on Cookbook: https://www.cookbook.dev/contracts/multi-collection-nft-with-pausable-transfers?utm=code
*/

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "./dependencies/ERC1155.sol";
import "./dependencies/Ownable.sol";
import "./dependencies/Pausable.sol";
import "./dependencies/ERC1155Burnable.sol";
import "./dependencies/ERC1155Supply.sol";

/**
 * @title Multi-Collection NFT with pausable transfers
 * @author Breakthrough Labs Inc.
 * @notice NFT, ERC1155, Pausable
 * @custom:version 1.0.7
 * @custom:address 18
 * @custom:default-precision 0
 * @custom:simple-description An NFT that supports creating multiple collections,
 * with ability for owner to pause NFT transfers.
 * @dev ERC1155 NFT, the basic standard multi-token, with the following features:
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
    constructor() payable ERC1155("") {}

    mapping(uint256 => bool) public soulbound;
    mapping(uint256 => string) public uris;
    mapping(uint256 => address) public resolver;
    mapping(address => uint256) public nonces;
    mapping(uint256 => uint256) public remaining_mints;
    mapping(uint256 => uint256) public expiration;
    mapping(uint256 => bytes32) public merkle_roots;
    mapping(uint256 => address) public proxyminter;
    mapping(uint256 => address) public admins;

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

    function generateID(address a, uint256 n) internal returns (uint256) {
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
        bytes memory proof
    ) external {
        _mint(receiver, id, 1, "");
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
