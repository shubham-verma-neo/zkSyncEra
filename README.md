# zkSyncEra

## Useful plugins

zkSync Era has the following official plugins for Hardhat:

- [@matterlabs/hardhat-zksync-solc](https://era.zksync.io/docs/tools/hardhat/hardhat-zksync-solc.html)- used to compile contracts written in Solidity.
- [@matterlabs/hardhat-zksync-vyper](https://era.zksync.io/docs/tools/hardhat/hardhat-zksync-vyper.html) - used to compile contracts written in Vyper.
- [@matterlabs/hardhat-zksync-deploy](https://era.zksync.io/docs/tools/hardhat/hardhat-zksync-deploy.html) - used to deploy smart contracts.
- [@matterlabs/hardhat-zksync-chai-matchers](https://era.zksync.io/docs/tools/hardhat/hardhat-zksync-chai-matchers.html) - adds zkSync-specific capabilities to the Chai assertion library for testing smart contracts.
- [@matterlabs/hardhat-zksync-verify](https://era.zksync.io/docs/tools/hardhat/hardhat-zksync-verify.html)- used to verify smart contracts.
- [@matterlabs/hardhat-zksync-upgradable](https://era.zksync.io/docs/tools/hardhat/hardhat-zksync-upgradable.html) - used to deploy, update, and verify proxy smart contracts.

# Greeter

This guide shows you how to deploy a smart contract to zkSync.

**This is what we're going to do:**

- Build, deploy, and verify a smart contract on the zkSync Era testnet that stores a greeting message.
- Build a TypeScript script that retrieves and updates the greeting message.

## Prerequisites

- Download and install [Node](https://nodejs.org/en/download).
- Download and install <code>[nvm](https://github.com/nvm-sh/nvm#installing-and-updating)</code> to change the running Node version to v16.16.0 with command <code>nvm use 16</code>.
- Use the <code>yarn</code>or <code>npm</code> package manager. We recommend using yarn. To install yarn, follow the [Yarn installation guide](https://yarnpkg.com/getting-started/install).
- A wallet with sufficient Göerli # zkSyncEra

## Build and deploy the Greeter contract

1. Install the [zkSync CLI](https://era.zksync.io/docs/tools/zksync-cli/): <br/><br/>
   <code> yarn add global zksync-cli@latest </code>
2. Scaffold a new project by running the command: <br/><br/>
   <code> zksync-cli create Greeter </code><br/><br/>
   This creates a new zkSync Era project called <code>Greeter</code> with a basic <code>Greeter</code> contract and all the zkSync plugins and configurations.
3. Navigate into the project directory:<br/><br/>
   <code> cd Greeter </code><br/><br/>
4. To configure your private key, copy the <code>.env.example</code> file, rename the copy to <code>.env</code>, and add your wallet private key.<br/><br/>
   <code>WALLET_PRIVATE_KEY=abcdef12345....</code>

## Compile and deploy the Greeter contract

We store all the smart contracts' <code>\*.sol</code> files in the <code>contracts</code> folder. The <code>deploy</code> folder contains all scripts related to deployments.

1. The included <code>contracts/Greeter.sol</code> contract has code.<br/>
2. Compile the contract with the following command:<br/><br/>
   <code>yarn hardhat compile</code><br/><br/>
3. The zkSync-CLI also provides a deployment script in <code>/deploy/deploy-greeter.ts</code>.<br/><br/>
   Run the deployment script with:<br/><br/>
   <code>yarn hardhat deploy-zksync --script deploy-greeter.ts</code><br/><br/>
   You should see something like this:<br/>
   ```
   Running deploy script for the Greeter contract
   The deployment is estimated to cost 0.00014060275 ETH
   Constructor args:0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000b4869204e656f534f465421000000000000000000000000000000000000000000
   The Greeter was deployed to 0x37F1A6E70E3473762F194F02466EDD73433A2D27
   Compiling contracts for zkSync Era with zksolc v1.3.13 and solc v0.8.17
   Compiling 1 Solidity file
   Your verification ID is: 34438
   Contract successfully verified on zkSync block explorer!
   ```

**Congratulations! You have deployed and verified a smart contract to zkSync Era Testnet 🎉**

Now visit the [zkSync block explorer mainnet](https://explorer.zksync.io/), [zkSync block explorer testnet](https://goerli.explorer.zksync.io/) and search with the contract address to confirm the deployment.

## Interact with Contract

1. The zkSync-CLI also provides a contract interaction script in <code>/deploy/use-greeter.ts</code>.<br/><br/>
   <code>yarn hardhat deploy-zksync --script use-greeter.ts</code><br/><br/>
   You should see something like this:<br/>
   ```
   Running a script to interact with contract 0x37F1A6E70E3473762F194F02466EDD73433A2D27
   The message is Hello people!
   Transaction to change the message is 0x3902ee0c80c1985b6f6ee5d8828bdd277754a9392c41802659004a3260b12fbe
   The message now is Hello NeoSOFT Guys!
   ```

# NeoToken

This guide shows you how to deploy an ERC20 smart contract to zkSync and how to read and write into the contract.

**This is what we're going to do:**

- Build, deploy, and verify an ERC20 smart contract on zkSync Era testnet that mints tokens to Owner's address.
- Build a TypeScript script that read the balance of the Owner.
- Build a TypeScript script that transfers the balance from Owner to Recipient.

## Prerequisites

- Download and install [Node](https://nodejs.org/en/download).
- Download and install <code>[nvm](https://github.com/nvm-sh/nvm#installing-and-updating)</code> to change the running Node version to v16.16.0 with command <code>nvm use 16</code>.
- Use the <code>yarn</code>or <code>npm</code> package manager. We recommend using yarn. To install yarn, follow the [Yarn installation guide](https://yarnpkg.com/getting-started/install).
- A wallet with sufficient Göerli # zkSyncEra

## Build and deploy the NeoToke contract

1. Install the [zkSync CLI](https://era.zksync.io/docs/tools/zksync-cli/): <br/><br/>
   <code> yarn add global zksync-cli@latest </code>
2. Scaffold a new project by running the command: <br/><br/>
   <code> zksync-cli create NeoToken </code><br/><br/>
   This creates a new zkSync Era project called <code>NeoToken</code> with a basic <code>Greeter</code> contract and all the zkSync plugins and configurations.
3. Navigate into the project directory:<br/><br/>
   <code> cd NeoToken </code><br/><br/>
4. Change the <code>Greeter</code> contract to your desire ERC20 contract, here for example <code>NeoToken</code>.
5. To configure your private key, copy the <code>.env.example</code> file, rename the copy to <code>.env</code>, and add your wallet private key.<br/><br/>
   <code>WALLET_PRIVATE_KEY=abcdef12345....</code>

## Compile and deploy the Greeter contract

We store all the smart contracts' <code>\*.sol</code> files in the <code>contracts</code> folder. The <code>deploy</code> folder contains all scripts related to deployments.

1. The included <code>contracts/NeoToken.sol</code> contract has code.<br/>
2. Compile the contract with the following command:<br/><br/>
   <code>yarn hardhat compile</code><br/><br/>
3. In this I also provide a deployment script in <code>/deploy/deploy.ts</code>.<br/><br/>
   Run the deployment script with:<br/><br/>
   <code>yarn hardhat deploy-zksync --script deploy.ts</code><br/><br/>
   You should see something like this:<br/>
   ```
   Running deploy script for the NeoToken contract
   0xf2a3e661573bd5ff2af26817e3839b32297d8e658bc1975322a8ec8fc3aeae70
   The deployment is estimated to cost 0.00032360075 ETH
   constructor args:0x0000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000084e656f546f6b656e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000024e54000000000000000000000000000000000000000000000000000000000000
   NeoToken was deployed to 0xd1c8001AE418FDA8aD7DD573933B4e6301a9e117
   Compiling 4 Solidity files
   Your verification ID is: 34581
   Contract successfully verified on zkSync block explorer!
   Contract verified, deployed to testnet: 34581
   ```

**Congratulations! You have deployed and verified a smart contract to zkSync Era Testnet 🎉**

Now visit the [zkSync block explorer mainnet](https://explorer.zksync.io/), [zkSync block explorer testnet](https://goerli.explorer.zksync.io/) and search with the contract address to confirm the deployment.

## Interact with Contract

1. In this I also provide a contract interaction script to read balance in <code>/deploy/read-NeoToken.ts</code>.<br/><br/>
   <code>yarn hardhat deploy-zksync --script read-NeoToken.ts</code><br/><br/>
   You should see something like this:<br/>

   ```
   Running a script to interact with contract 0xd1c8001AE418FDA8aD7DD573933B4e6301a9e117
   The balance of the Owner is 1000000000000000000000
   ```

2. In this I also provide a contract interaction script to transfer balance in <code>/deploy/write-NeoToken.ts</code>.<br/><br/>
   <code>yarn hardhat deploy-zksync --script write-NeoToken.ts</code><br/><br/>
   You should see something like this:<br/>
   ```
   Running a script to interact with contract 0xd1c8001AE418FDA8aD7DD573933B4e6301a9e117
   Balance of the Owner(0x5cf1D4A44Ee4cFA6747A6557E34b170c90476a6c) before transfer is 900000000000000000000
   Before transfer the Recipient(0x00B5675e33Cb9026aAEf1acAD8F8efE174bd40c9) balance is 100000000000000000000
   Transaction to change the message is 0x688c7f190cb6a1795d6c35c7098ecaf30f3696de40dc18010d12d347eb916f8e
   Balance of the Owner(0x5cf1D4A44Ee4cFA6747A6557E34b170c90476a6c) after transfer is 800000000000000000000
   After transfer the Recipient(0x00B5675e33Cb9026aAEf1acAD8F8efE174bd40c9) balance now is 200000000000000000000
   ```
