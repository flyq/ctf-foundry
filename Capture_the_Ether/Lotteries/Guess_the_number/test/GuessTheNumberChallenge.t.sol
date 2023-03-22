pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/GuessTheNumberChallenge.sol";

contract GuessTheNumberChallengeTest is Test {
    GuessTheNumberChallenge public guessTheNumberChallenge;
    address alice = address(0xf);

    function setUp() public {
        payable(alice).transfer(1 ether);

        guessTheNumberChallenge = new GuessTheNumberChallenge{value: 1 ether}();
    }

    function testGuessTheNumber() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);

        vm.startPrank(alice);
        guessTheNumberChallenge.guess{value: 1 ether}(42);
        vm.stopPrank();

        uint256 laterValue = alice.balance;
        emit log_named_uint("alice value", laterValue);

        assertEq(beforeValue + 1 ether, laterValue);
    }
}
