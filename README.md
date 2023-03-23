# ctf-foundry

Collect solidity/evm related ctf and use foundry to reproduce

## content
- [ctf-foundry](#ctf-foundry)
  - [content](#content)
  - [Solutions](#solutions)
  - [how to use(Example)](#how-to-useexample)
    - [build](#build)
    - [test](#test)
    - [deploy](#deploy)
  - [reference](#reference)

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
* [Capture the Ether](https://capturetheether.com/)
* 
