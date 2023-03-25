// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/GuessTheNewNumberChallenge.sol";

contract GuessTheNewNumberChallengeTest is Test {
    GuessTheNewNumberChallenge public guessTheNewNumberChallenge;
    address alice = address(0xf);

    function setUp() public {
        payable(alice).transfer(1 ether);

        guessTheNewNumberChallenge = new GuessTheNewNumberChallenge{value: 1 ether}();
    }

    function testGuessTheNewNumber() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);

        uint8 answer = uint8(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))[0]);
        emit log_named_uint("answer", answer);
       
        vm.startPrank(alice);
        guessTheNewNumberChallenge.guess{value: 1 ether}(answer);
        vm.stopPrank();

        uint256 laterValue = alice.balance;
        emit log_named_uint("alice value", laterValue);

        assertEq(beforeValue + 1 ether, laterValue);
        assertEq(guessTheNewNumberChallenge.isComplete(), true);
    }
}
