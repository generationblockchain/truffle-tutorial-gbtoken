/* This script transfers the specified number of tokens
 * from account[0] to the specified recipient account.
 */

var GBToken = artifacts.require("./GBToken.sol");

module.exports = function(callback) { 
    var recipientAccount = web3.eth.accounts[1];
    var transferAmount = 50; // number of tokens

    GBToken.deployed()
    .then(function(instance){
        return instance.send(recipientAccount, transferAmount);
    });
}