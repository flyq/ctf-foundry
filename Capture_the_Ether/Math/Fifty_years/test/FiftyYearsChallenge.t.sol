// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/FiftyYearsChallenge.sol";

contract FiftyYearsChallengeTest is Test {
    FiftyYearsChallenge public fiftyYearsChallenge;
    address alice = makeAddr("alice");

    function setUp() public {
        fiftyYearsChallenge = new FiftyYearsChallenge{value: 1 ether}(address(this));
    }

    function testFiftyYears() public {
        vm.startPrank(alice);
        
    }

}