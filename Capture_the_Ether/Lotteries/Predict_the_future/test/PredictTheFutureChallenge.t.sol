pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/PredictTheFutureChallenge.sol";
import "../src/PredictTheFutureAttacker.sol";

contract PredictTheFutureChallengeTest is Test {
    PredictTheFutureChallenge public predictTheFutureChallenge;
    address alice = address(0xf);

    function setUp() public {
        payable(alice).transfer(2 ether);

        predictTheFutureChallenge = new PredictTheFutureChallenge{value: 1 ether}();
    }

    function testPredictTheFurture() public {
        uint256 beforeValue = alice.balance;
        emit log_named_uint("alice value", beforeValue);

        vm.startPrank(alice);
        
            PredictTheFutureAttacker attacker = new PredictTheFutureAttacker(address(predictTheFutureChallenge));
            attacker.lockInGuess{value: 1 ether}(10);

            // after a block;
            vm.roll(block.number + 1);

            vm.expectRevert();
            attacker.attack();
        

        vm.stopPrank();

        uint256 laterValue = alice.balance;
        emit log_named_uint("alice value", laterValue);
    }

}