// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/GuessTheRandomNumberChallenge.sol";

contract GuessTheRandomNumberChallengeTest is Test {
    GuessTheRandomNumberChallenge public guessTheRandomNumberChallenge;
    address alice = address(0xf);

    function setUp() public {
        payable(alice).transfer(1 ether);

        guessTheRandomNumberChallenge = new GuessTheRandomNumberChallenge{value: 1 ether}();
    }

    function testGuessTheRandomNumber() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);

        // when onchain, 
        // 1. we can get the deployed blockhash and block.timestamp in etherscan
        // 2. or we can get the first storage slot(which stores the answer) directly
        uint8 answer = uint8(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))[0]);
        emit log_named_uint("answer", answer);

        vm.startPrank(alice);
        guessTheRandomNumberChallenge.guess{value: 1 ether}(answer);
        vm.stopPrank();

        uint256 laterValue = alice.balance;
        emit log_named_uint("alice value", laterValue);

        assertEq(beforeValue + 1 ether, laterValue);
        assertEq(guessTheRandomNumberChallenge.isComplete(), true);
    }
}
