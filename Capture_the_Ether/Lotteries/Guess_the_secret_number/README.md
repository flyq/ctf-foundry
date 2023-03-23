# Guess the secret number

## get the secret from rust 

```sh
cd ./rs/keccak

cargo run
Compiling keccak v0.1.0 (/Users/flyq/workspace/github/flyq/ctf-foundry/Capture_the_Ether/Lotteries/Guess_the_secret_number/rs/keccak)
    Finished dev [unoptimized + debuginfo] target(s) in 0.19s
     Running `target/debug/keccak`
hash(170): "db81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365"
```

so the secret is 170, and set it to the GuessTheSecretNumberChallenge.t.sol

```sh
cd ctf-foundry/

forge test -C ./Capture_the_Ether/Lotteries/Guess_the_secret_number -vvv
```
