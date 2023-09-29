// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

/* solhint-disable reason-string */
/* solhint-disable no-inline-assembly */
import "hardhat/console.sol";
import "./core/BasePaymaster.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

/**
 * A sample paymaster that uses external service to decide whether to pay for the UserOp.
 * The paymaster trusts an external signer to sign the transaction.
 * The calling user must pass the UserOp to that external signer first, which performs
 * whatever off-chain verification before signing the UserOp.
 * Note that this signature is NOT a replacement for the account-specific signature:
 * - the paymaster checks a signature to agree to PAY for GAS.
 * - the account checks a signature to prove identity and account ownership.
 */
contract NFTPaymaster is BasePaymaster {
    using ECDSA for bytes32;
    using UserOperationLib for UserOperation;

    uint256 private constant VALID_TIMESTAMP_OFFSET = 20;

    uint256 private constant SIGNATURE_OFFSET = 84;
    uint256 public tokenid;
    bytes32 public merkleRoot;
    mapping(address => bool) public used;

    // address public token;

    constructor(
        IEntryPoint _entryPoint,
        //address token,
        bytes32 _root,
        uint256 _id
    ) BasePaymaster(_entryPoint) {
        tokenid = _id;
        merkleRoot = _root;
    }

    function verifyProof(
        address a,
        bytes32 merkleroot,
        bytes32[] memory proof
    ) internal pure returns (bool) {
        bytes32 leaf = keccak256(bytes.concat(keccak256((abi.encode(a)))));
        return MerkleProof.verify(proof, merkleroot, leaf);
    }

    /**
     * verify our external signer signed this request.
     * the "paymasterAndData" is expected to be the paymaster and a signature over the entire request params
     * paymasterAndData[:20] : address(this)
     * paymasterAndData[20:84] : abi.encode(validUntil, validAfter)
     * paymasterAndData[84:] : signature
     */
    function _validatePaymasterUserOp(
        UserOperation calldata userOp,
        bytes32 userOpHash,
        uint256 requiredPreFund
    ) internal override returns (bytes memory context, uint256 validationData) {
        (requiredPreFund);

        bytes32[] memory proof = parsePaymasterAndData(userOp.paymasterAndData);
        require(proof.length >= 1, "invalid proof length");
        (address tokenAddr, uint256 callValue, ) = abi.decode(
            userOp.callData[4:], // skip selector
            (address, uint256, bytes)
        );
        bytes calldata data;

        {
            //offset represents where does the inner bytes array start
            uint256 offset = uint256(bytes32(userOp.callData[4 + 64:4 + 96]));
            uint256 length = uint256(
                bytes32(userOp.callData[4 + offset:4 + offset + 32])
            );
            //we expect data to be the `IERC20.transfer(address, uint256)` calldata
            data = userOp.callData[4 + offset + 32:4 + offset + 32 + length];
        }
        bytes4 sig = bytes4(data[0:4]);
        require(
            sig == bytes4(keccak256("ProxyMint(address,uint256)")),
            "invalid userOp must be ProxyMint"
        );
        (address a, uint256 id) = abi.decode(data[4:], (address, uint256));
        require(id == tokenid, "invalid token id mint");
        address signer = ECDSA.recover(
            userOpHash.toEthSignedMessageHash(),
            userOp.signature
        );

        bool proofCheck = verifyProof(signer, merkleRoot, proof);

        if (!proofCheck) {
            return ("", _packValidationData(true, 0, 0));
        }
        require(used[signer] == false, "signers can only be used once");
        used[signer] == true;
        //no need for other on-chain validation: entire UserOp should have been checkesignatured
        // by the external service prior to signing it.
        return ("", _packValidationData(false, 0, 0));
    }

    function parsePaymasterAndData(
        bytes calldata paymasterAndData
    ) public pure returns (bytes32[] memory) {
        //console.log(paymasterAndData.length);
        //console.log(string(paymasterAndData));
        bytes32[] memory proof = abi.decode(
            paymasterAndData[VALID_TIMESTAMP_OFFSET:],
            (bytes32[])
        );
        return proof;
    }
}
