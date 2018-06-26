pragma solidity ^0.4.20;

/* GenerationBlockchain token, simplest implementation.
   Not Safe. See:
    - https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/token/ERC20/BasicToken.sol
    - https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/token/ERC20/SafeERC20.sol
*/
contract GBToken {

    /* This creates an array with all balances */
    mapping (address => uint) balances;
    
    /* This generates a public event on the blockchain that will notify listening clients */
    event TransferGB(address indexed from, address indexed to, uint value);

    /* Initialize the contract, this is the "constructor" */
    constructor(uint initialSupply) public {
        // give all tokens to the creator of the contract
        balances[msg.sender] = initialSupply;
    }
    
    /* Send tokens from the message sender's account to the specified account */
    function send(address receiver, uint amount) public {
        // if sender does not have enough money
        if (balances[msg.sender] < amount) return;
        
        // take funds out of sender's account
        balances[msg.sender] -= amount;
        
        // add those funds to receipient's account
        balances[receiver] += amount;

        emit TransferGB(msg.sender, receiver, amount);
    }
    
    function getBalance(address addr) public view returns (uint) {
        return balances[addr];
    }
}
