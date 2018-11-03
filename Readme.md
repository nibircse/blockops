# Blockops: Blockchain Devops

This repository is a Subutai project template to rapidly setup Ethereum
Blockchain based Dapp projects and the infrastructure needed for them. It
uses the best of breed patterns and tools to rapidly develop and deploy
Dapps with their Ethereum Smart Contracts onto test and production blockchains.

## What does it do?

It makes life easy and increases productivity. We've automated the use of
patterns and tools to increase productivity and reduce error in the Dapp
development lifecycle:

1. change the code
2. unit test it
3. deploy to a test network
4. integration test
5. verification test
6. deploy to a production network

And do this over and over again with reproducable results without human error.
The blockchain is complex enough with all the different moving parts. Let's not
make it harder than it needs to be.

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

## Testing Integration

Unit testing, integration testing, and verification testing are all important
aspects of building proper Dapps that go beyond the academic examples found
in textbooks. Often developers overlook the need to write unit tests because
they don't have time to deal with the automation scaffolding involved to 
integrate test runs as part of the process. Most don't even get to the level of
integration testing, and you might as well forget about through contract 
verification testing.

> It's like sex in high school: everyone talks about it, but almost no one
does it.

## Project Drivers

We found ourselves always having to recreate the same skeletal infrastructure
every time we wanted to start on a new Dapp. That usually sucked a day or two
of time so we wanted the machines to handle this for us in minutes at a press
of a button.

Doing this manually produced different results by different developers, so
again we knew the machines can do it better and more reliably: i.e. some 
developers don't think certain automatic workflow features like running test
cases before deploying are important. This template requires unit tests to
run before deploying contracts onto sidechains or private networks. There's
more to it and much more to come to make life as simple stupid as possible for
passionately process oriented developers.

It was created for those interested in doing things right, properly, with a
hard core approach that is the same every time. Predictability, reliability,
testing and devops go together.

> This is a tool in our toolbox that we want to share with others. Please help
us make it better.

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
