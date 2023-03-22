# Deploy a contract

```sh
cd ctf-foundry

source .env

forge script ./Capture_the_Ether/Warmup/Deploy_a_contract/script/DeployChallenge.s.sol --fork-url $GOERLI_RPC_URL --broadcast -vvv
...
## Setting up (1) EVMs.

==========================

Chain 5

Estimated gas price: 14.215834176 gwei

Estimated total gas used for script: 102891

Estimated amount required: 0.001462681394202816 ETH

==========================

###
Finding wallets for all the necessary addresses...
##
Sending transactions [0 - 0].
⠁ [00:00:00] [###################################################################################] 1/1 txes (0.0s)
Transactions saved to: /Users/flyq/workspace/github/flyq/ctf-foundry/broadcast/DeployChallenge.s.sol/5/run-latest.json

##
Waiting for receipts.
⠉ [00:00:38] [##############################################################################################] 1/1 receipts (0.0s)
##### goerli
✅ Hash: 0x70677017172f303b04bdff3ba80b098d096495450d51b6d68b1da6e13095ddc4
Contract Address: 0x8ed5f3b14bd9d8284894f63d6fae88e63962d4da
Block: 8696183
Paid: 0.000781596342988903 ETH (79157 gas * 9.874001579 gwei)


Transactions saved to: /Users/flyq/workspace/github/flyq/ctf-foundry/broadcast/DeployChallenge.s.sol/5/run-latest.json



==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
Total Paid: 0.000781596342988903 ETH (79157 gas * avg 9.874001579 gwei)

Transactions saved to: /Users/flyq/workspace/github/flyq/ctf-foundry/broadcast/DeployChallenge.s.sol/5/run-latest.json
```