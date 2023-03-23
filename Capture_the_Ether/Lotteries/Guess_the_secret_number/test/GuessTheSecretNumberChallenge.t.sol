pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/GuessTheSecretNumberChallenge.sol";

contract GuessTheSecretNumberChallengeTest is Test {
    GuessTheSecretNumberChallenge public guessTheSecretNumberChallenge;
    address alice = address(0xf);

    function setUp() public {
        payable(alice).transfer(1 ether);

        guessTheSecretNumberChallenge = new GuessTheSecretNumberChallenge{value: 1 ether}();
    }

    function testGuessTheSecretNumber() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);

        vm.startPrank(alice);
        guessTheSecretNumberChallenge.guess{value: 1 ether}(170);
        vm.stopPrank();

        uint256 laterValue = alice.balance;
        emit log_named_uint("alice value", laterValue);

        assertEq(beforeValue + 1 ether, laterValue);
        assertEq(guessTheSecretNumberChallenge.isComplete(), true);
    }
}
