// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/MappingChallenge.sol";

contract MappingChallengeTest is Test {
    MappingChallenge public mappingChallenge;
    address alice = makeAddr("alice");

    function setUp() public {
        mappingChallenge = new MappingChallenge();
    }

    function testMapping() public {
        uint256 MAX_INT = 2**256-1;
        uint256 slot = MAX_INT - uint256(keccak256(abi.encode(1))) + 1;

        // after solidity 0.6.0, array.length is read only;
        // so this trick can't be used.
        vm.expectRevert();
        mappingChallenge.set(slot, 1);
    }

}