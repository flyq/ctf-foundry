# Deploy a contract

```sh
cd ctf-foundry

source .env

forge script ./Capture_the_Ether/Warmup/Call_me/script/CallMeChallenge.s.sol --fork-url $GOERLI_RPC_URL --broadcast -vvv
```