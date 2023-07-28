import { Wallet, Provider, utils } from "zksync-web3";
import * as ethers from "ethers";
import { HardhatRuntimeEnvironment } from "hardhat/types";

// load env file
import dotenv from "dotenv";
dotenv.config();

// load contract artifact. Make sure to compile first!
import * as ContractArtifact from "../artifacts-zk/contracts/NeoToken.sol/NeoToken.json";

const PRIVATE_KEY = process.env.WALLET_PRIVATE_KEY || "";

if (!PRIVATE_KEY)
  throw "⛔️ Private key not detected! Add it to the .env file!";

// Address of the contract on zksync testnet
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS || "";

if (!CONTRACT_ADDRESS) throw "⛔️ Contract address not provided";

// An example of a deploy script that will deploy and call a simple contract.
export default async function (hre: HardhatRuntimeEnvironment) {
  console.log(`Running script to interact with contract ${CONTRACT_ADDRESS}`);

  // Initialize the provider.
  // @ts-ignore
  const provider = new Provider(hre.userConfig.networks?.zkSyncTestnet?.url);

  const signer = new ethers.Wallet(PRIVATE_KEY, provider);

  // Initialize the wallet.
  const wallet = new Wallet(PRIVATE_KEY);

  // Initialize contract instance
  const contract = new ethers.Contract(
    CONTRACT_ADDRESS,
    ContractArtifact.abi,
    signer
  );

  const recipientAddress = process.env.RECIPIENT_ADDRESS;

  // Read balance from contract
  console.log(
    `Balance of the Owner(${
      wallet.address
    }) before transfer is ${await contract.balanceOf(wallet.address)}`
  );
  console.log(
    `Before transfer the Recipient(${recipientAddress}) balance is ${await contract.balanceOf(
      recipientAddress
    )}`
  );

  // Write message from contract
  const tx = await contract.transfer(
    recipientAddress,
    ethers.utils.parseEther("100")
  );
  console.log(`Transaction to change the message is ${tx.hash}`);
  await tx.wait();

  // Read balance from contract
  console.log(
    `Balance of the Owner(${
      wallet.address
    }) after transfer is ${await contract.balanceOf(wallet.address)}`
  );
  console.log(
    `After transfer the Recipient(${recipientAddress}) balance now is ${await contract.balanceOf(
      recipientAddress
    )}`
  );
}
