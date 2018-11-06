var ERC20GwToken = artifacts.require("./contracts/ERC20GwToken.sol");
var ERC20KhanToken = artifacts.require("./contracts/ERC20KhanToken.sol");
var MarketMaker = artifacts.require("./contracts/MarketMaker.sol");
var fs = require('fs');
var config = require('../config.json');

module.exports = function(deployer) {
   deployer.deploy(ERC20GwToken).then( function() {

    return deployer.deploy(ERC20KhanToken).then(function() { 

        return deployer.deploy(MarketMaker,ERC20KhanToken.address, ERC20GwToken.address, config.max_exchange_value_in_wei, config.min_contract_balance_in_wei, config.amount_to_buy_on_min_in_wei).then( function() {   
            fs.writeFile("src/marketmaker.js",
            'import  web3 from \'./web3\';\n' +
            'const address = ' + "\'" + MarketMaker.address + "\';"+ "\n" +
            'const abi='+JSON.stringify(MarketMaker.abi) + "; \n" + 
            'export default  new  web3.eth.Contract(abi, address);');

            // ERC20GwToken.transfer(MarketMaker.address, 20000000000000000000 );
            // ERC20KhanToken.transfer(MarketMaker.address, 10000000000000000000 );
            
     });
    });
   });
};