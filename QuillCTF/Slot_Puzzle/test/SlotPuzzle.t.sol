// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import {SlotPuzzle} from "src/SlotPuzzle.sol";
import {SlotPuzzleFactory} from "src/SlotPuzzleFactory.sol";
import {Parameters,Recipients} from "src/interface/ISlotPuzzleFactory.sol";


contract SlotPuzzleTest is Test {
    SlotPuzzle public slotPuzzle;
    SlotPuzzleFactory public slotPuzzleFactory;
    address hacker;

    function setUp() public {
        slotPuzzleFactory = new SlotPuzzleFactory{value: 3 ether}();
        hacker = makeAddr("hacker");
    }

    function testHack() public {
        vm.startPrank(hacker,hacker);
        assertEq(address(slotPuzzleFactory).balance, 3 ether, "weth contract should have 3 ether");

        //hack time

        assertEq(address(slotPuzzleFactory).balance, 0, "weth contract should have 0 ether");
        assertEq(address(hacker).balance, 3 ether, "hacker should have 3 ether");

        
        vm.stopPrank();
    }
}