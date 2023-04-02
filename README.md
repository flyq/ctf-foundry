# ctf-foundry

Collect solidity/evm related ctf and use foundry to reproduce


## Solutions

- Capture the Ether
  - Warmup
    - [Deploy a contract](./Capture_the_Ether/Warmup/Deploy_a_contract/)
    - [Call me](./Capture_the_Ether/Warmup/Call_me/)
    - [Choose a nickname](./Capture_the_Ether/Warmup/Choose_a_nickname/)
  - Lotteries
    - [Guess the number](./Capture_the_Ether/Lotteries/Guess_the_number/)
    - [Guess the secret number](./Capture_the_Ether/Lotteries/Guess_the_secret_number/)
    - [Guess the random number](./Capture_the_Ether/Lotteries/Guess_the_random_number/)
    - [Guess the new number](./Capture_the_Ether/Lotteries/Guess_the_new_number/)
    - [Predict the future](./Capture_the_Ether/Lotteries/Predict_the_future/)
    - [Predict the block hash](./Capture_the_Ether/Lotteries/Predict_the_block_hash/)
  - Math
    - [Token sale](./Capture_the_Ether/Math/Token_sale/)
    - [Token whale](./Capture_the_Ether/Math/Token_whale/)
    - [Retirement fund](./Capture_the_Ether/Math/Retirement_fund/)
    - [Mapping](./Capture_the_Ether/Math/Mapping/)
    - [Donation](./Capture_the_Ether/Math/Donation/)
    - [Fifty years](./Capture_the_Ether/Math/Fifty_years/)
- QuillCTF
  - [Slot Puzzle](./QuillCTF/Slot_Puzzle/)

## how to use(Example)
### build
```sh
forge build -C ./Counter
```

### test
```sh
forge test -C ./Counter -vvv
```

### deploy
```sh
cp .env.example .env

# add the keys in .env

source .env

forge script ./Counter/script/Counter.s.sol:CounterScript --fork-url $GOERLI_RPC_URL --broadcast -vvv
```

## reference
* Lists
  * [Blocksec CTFs](https://github.com/blockthreat/blocksec-ctfs)
  * [Awesome Ethereum Security](https://github.com/crytic/awesome-ethereum-security)
  * [CTF Blockchain Challenges](https://github.com/minaminao/ctf-blockchain)
  * [CTFGym](https://github.com/PumpkingWok/CTFGym)
* [Capture the Ether](https://capturetheether.com/)
* [QuillCTF](https://quillctf.super.site/)
* [Ethernaut](https://ethernaut.openzeppelin.com/)
* [Damn Vulnerable DeFi](https://www.damnvulnerabledefi.xyz/)
* [Paradigm CTF](https://ctf.paradigm.xyz/)
* [Mr Steal Yo Crypto](https://mrstealyocrypto.xyz/)
