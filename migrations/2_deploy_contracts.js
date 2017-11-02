var fs = require('fs'); // This allows us to write the address of the deployed contract to a file which Python can then read

var AggSimple = artifacts.require("./AggSimple.sol");     // Simple ADMM aggregator: No checks for iteration number or stopping
var Aggregator = artifacts.require("./Aggregator.sol");   // More sophisticated aggregator: Checks iteration, stopping criteria, saves result
var accts = [web3.eth.accounts[0],web3.eth.accounts[1]];  // These will define the whitelist of participants who can submit updates to the blockchain

module.exports = function(deployer) {
  deployer.deploy(AggSimple).then(function(){
    fs.writeFile("./AggSimpleAddress.txt",AggSimple.address,
      function(err){if(err){console.log(err);} return;})
  });
  deployer.deploy(Aggregator, accts).then(function(){
    fs.writeFile("./AggregatorAddress.txt",Aggregator.address,
      function(err){if(err){console.log(err);} return;})
  });

};


// Truffle commands to access the deployed contractor:

// var aggsimple; AggSimple.deployed().then(function(a){aggsimple=a;});
// var agg; Scratch.deployed().then(function(a){agg=a;});