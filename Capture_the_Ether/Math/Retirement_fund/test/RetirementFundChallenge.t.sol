// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/RetirementFundChallenge.sol";
import "../src/Attacker.sol";

contract RetirementFundChallengeTest is Test {
    RetirementFundChallenge public retirementFundChallenge;
    address alice = makeAddr("alice");

    function setUp() public {
        payable(alice).transfer(1 ether);
        retirementFundChallenge = new RetirementFundChallenge{value: 1 ether}(alice);
    }

    // without fallback function, it reverts;
    function testRetirementFund1() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);

        vm.startPrank(alice);
            vm.expectRevert();
            payable(address(retirementFundChallenge)).transfer(0.5 ether);
            
            emit log_named_uint("fund balance", address(retirementFundChallenge).balance);
            
            vm.expectRevert();
            retirementFundChallenge.collectPenalty();
        vm.stopPrank();

        uint256 afterValue = alice.balance;
        emit log_named_uint("alice value", afterValue);
        assertEq(retirementFundChallenge.isComplete(), false);
    }


    function testRetirementFund2() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);

        vm.startPrank(alice);
            new RetirementFundAttacker{value: 1 wei}(payable(address(retirementFundChallenge)));

            emit log_named_uint("fund balance", address(retirementFundChallenge).balance);
            
            retirementFundChallenge.collectPenalty();
        vm.stopPrank();

        uint256 afterValue = alice.balance;
        emit log_named_uint("alice value", afterValue);
        assertEq(retirementFundChallenge.isComplete(), true);
    }
}