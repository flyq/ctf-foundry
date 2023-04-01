// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import {SlotPuzzle} from "../src/SlotPuzzle.sol";
import {SlotPuzzleFactory} from "../src/SlotPuzzleFactory.sol";
import {Parameters,Recipients} from "../src/interface/ISlotPuzzleFactory.sol";


contract SlotPuzzleTest is Test {
    using stdStorage for StdStorage;

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

        // hack time
        Recipients memory _recipients = Recipients({account: hacker, amount: 3 ether});
        Recipients[] memory _recis = new Recipients[](1);
        _recis[0] = _recipients;

        Parameters memory _parameters = Parameters({
            totalRecipients: 1,
            offset: 0,
            recipients: _recis,
            slotKey: new bytes(10)
        });

        //address _addr = slotPuzzleFactory.deploy(_parameters);

        //(bytes32[] memory readSlots, bytes32[] memory writeSlots) = vm.accesses(_addr);
        // emit log_uint(readSlots.length);
        // emit log_uint(writeSlots.length);

        // for (uint256 i = 0; i < readSlots.length; i++) {
        //     emit log_named_bytes32("read", readSlots[i]);
        // }
        // for (uint256 i = 0; i < readSlots.length; i++) {
        //     emit log_named_bytes32("write", writeSlots[i]);
        // }

        // uint256 slot = stdstore.target(_addr).sig("ghostInfo()").find();
        // emit log_named_uint("slot", slot);


        // slotPuzzleFactory.deploy(_parameters);

        // TODO
        // assertEq(address(slotPuzzleFactory).balance, 0, "weth contract should have 0 ether");
        // assertEq(address(hacker).balance, 3 ether, "hacker should have 3 ether");

        
        vm.stopPrank();
    }
}