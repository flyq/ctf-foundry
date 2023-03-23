# Predict the block hash

> block.blockhash(uint blockNumber) returns (bytes32): hash of the given block - only works for 256 most recent, excluding current, blocks - deprecated in version 0.4.22 and replaced by blockhash(uint blockNumber).


```sh
forge test -C ./Capture_the_Ether/Lotteries/Predict_the_block_hash -vvv
```