// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.19;

contract GuessTheNewNumberChallenge {
    constructor() payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);
        uint8 answer = uint8(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))[0]);

        if (n == answer) {
            payable(msg.sender).transfer(2 ether);
        }
    }
}