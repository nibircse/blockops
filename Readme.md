# Blockops: Blockchain Devops

This repository is a project template for Ethereum Blockchain based Dapp
projects. It uses the best of breed patterns and tools to rapidly develope
and deploy Dapps and their Ethereum Smart Contracts onto the blockchain.

## Is Blockops something you should use?

Ask yourself:

1. Are you just starting to develop Solidity based Smart Contracts?
2. Are you new to the tools and deployment patters around blockchain?
3. Do you want to get up and running rapidly?
4. Do you want a pre-packaged project to facilitate the change, deploy, and
test lifecycle?
5. Do you lack the knowhow to create your own blockchain network or sidechain?
6. Do you lack the infrastructure needed to do so?

If you answered yes to any of these questions then Blockops is what you are
looking for. Developing reliable and tested Dapps is a PITA without the tools
and configuration management to make the process simple and easy.

## Project Drivers

We found ourselves always having to recreate the same skeletal infrastructure
every time we wanted to start on a new Dapp. That usually sucked a day or two
of time so we wanted the machines to handle this for us in minutes at a press
of a button.

Doing this manually produced different results so again we knew the machines
can do it better and more reliably. Some developers don't think certain things
like running test cases before deploying are important. This template requires
that before deploying contracts onto sidechains or private networks.

It was created for those interested in doing things right, properly, with a
hard core approach that is the same every time.

## Using the Example Application

This template comes with an example market maker (cryptocurrency exchange
component) Dapp. You can install this to test the template then replace the
Dapp with your own.

>> NOTE: this is a trivial application and not intended for production so we
accept no liability or make no guarantees. Use it at your own risk.

### Install dependencies
```
npm install --save
```

### Deploy contracts to local blockchain
```
truffle migrate --network development  --reset
```

### Run tests

1) Compile contracts with the command
```
truffle compile
```

2) Run tests
```
npm run test
```

## Requirements to run application
1) Change `production` section in truffle.js

2) Deploy contracts to testnet, with command:
```
truffle migrate --network production  --reset
```
3) Run application

```
npm run start
```