import { Wallet } from "ethers";
import { StandardMerkleTree } from "@openzeppelin/merkle-tree";
import { ethers } from "hardhat";
import { expect } from "chai";
import {
  EntryPoint,
  SimpleAccount,
  SimpleAccount__factory,
  VerifyingPaymaster,
  NFTPaymaster,
  NFTPaymaster__factory,
  VerifyingPaymaster__factory,
  MockNFT,
  MockNFT__factory,
} from "../typechain";
import {
  createAccount,
  createAccountOwner,
  createAddress,
  deployEntryPoint,
} from "./testutils";
import { fillAndSign, simulateValidation } from "./UserOp";
import {
  arrayify,
  defaultAbiCoder,
  hexConcat,
  parseEther,
} from "ethers/lib/utils";
import { UserOperation } from "./UserOperation";

const MOCK_VALID_UNTIL = "0x00000000deadbeef";
const MOCK_VALID_AFTER = "0x0000000000001234";
const MOCK_SIG = "0x1234";

describe("EntryPoint with VerifyingPaymaster", function () {
  let entryPoint: EntryPoint;
  let accountOwner: Wallet;
  const ethersSigner = ethers.provider.getSigner();
  let account: SimpleAccount;
  let offchainSigner: Wallet;
  let tree: any;
  let paymaster: VerifyingPaymaster;
  let mock: MockNFT;
  before(async function () {
    this.timeout(20000);
    console.log("deploy entry");
    entryPoint = await deployEntryPoint();
    console.log("deploy offchain signer");
    offchainSigner = createAccountOwner();
    console.log("deploy account owner");
    accountOwner = createAccountOwner();
    const values = [
      [(await offchainSigner.getAddress()).toLowerCase()],
      [(await accountOwner.getAddress()).toLowerCase()],
    ];
    // (2)
    tree = StandardMerkleTree.of(values, ["address"]);
    console.log(tree.dump());
    console.log(tree.values);
    console.log(tree.leafHash(values[0]));
    console.log(tree.leafHash(values[1]));
    console.log("deploy account");
    account = await new SimpleAccount__factory(ethersSigner).deploy(
      entryPoint.address
    );
    console.log("deploy mock nft");
    mock = await new MockNFT__factory(ethersSigner).deploy();
    console.log("deploy paymaster");
    console.log(tree.root);
    paymaster = await new NFTPaymaster__factory(ethersSigner).deploy(
      entryPoint.address,
      tree.root,
      1
    );
    await paymaster.addStake(1, { value: parseEther("2") });
    await entryPoint.depositTo(paymaster.address, { value: parseEther("1") });
    ({ proxy: account } = await createAccount(
      ethersSigner,
      accountOwner.address,
      entryPoint.address
    ));
  });

  describe("#validatePaymasterUserOp", () => {
    it("succeed with valid signature", async () => {
      const SimpleAccount = await ethers.getContractFactory("SimpleAccount");

      const executeMint = mock.interface.encodeFunctionData("ProxyMint", [
        offchainSigner.address,
        1,
      ]);
      console.log(executeMint);
      let _callData = SimpleAccount.interface.encodeFunctionData("execute", [
        offchainSigner.address,
        0,
        executeMint,
      ]);
      console.log(_callData);
      let proof = tree.getProof(1);
      console.log(proof);
      console.log(`${paymaster.address} the paymaster address`);
      let bytes = ethers.utils.defaultAbiCoder.encode(["bytes32[]"], [proof]);
      console.log(`ABI ENCODED ${bytes}`);
      bytes = `${paymaster.address}${bytes.slice(2)}`;
      console.log(bytes);

      const userOp = await fillAndSign(
        {
          sender: account.address,
          paymasterAndData: bytes,
          callData: _callData,
        },
        accountOwner,
        entryPoint
      );
      console.log("HUMAN SIGNER", accountOwner.address);
      console.log(userOp);
      const res = await simulateValidation(userOp, entryPoint.address);
      expect(res.returnInfo.sigFailed).to.be.false;
    });
  });
});
