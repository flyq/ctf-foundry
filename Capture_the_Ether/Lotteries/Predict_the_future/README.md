# Predict the block hash

we can change `10` from `0` to `10`, and run the test to try attack in different block, and each failed attempt won't change guesser to address(0), as the Attacker contract will revert if not success.

```solidity
            attacker.lockInGuess{value: 1 ether}(10);
```

```sh
forge test -C ./Capture_the_Ether/Lotteries/Predict_the_future -vvv
```