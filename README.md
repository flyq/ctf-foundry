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
    - 

## how to use(Example)
### build
```sh
forge build -C ./Counter
```

### test
```sh
forge test -C ./Counter
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
