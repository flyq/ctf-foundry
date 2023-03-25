# Token Whale

The `_transfer` shouldn't use the `msg.sender`, which causes the bug in `transferFrom`

```sh
forge test -C ./Capture_the_Ether/Math/Token_Whale -vvv
```