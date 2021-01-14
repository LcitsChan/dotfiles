# [yabai](https://github.com/koekeishiya/yabai)

> Tiling window management for the Mac.

## Preparation

### Disable SIP

#### What is [SIP](https://support.apple.com/en-us/HT204899)

#### How

1. Turn off your computer
2. Turn on your Mac and immediately press and hold <kbd>⌘R</kbd>
3. Release the keys when Utilities window show
4. Choose Utilities > Terminal
5. Run the command `csrutil disable`
6. Restart your computer

#### Check status

```shell
$ csrutil status
```

## Install 

```shell
$ brew install koekeishiya/formulae/yabai
$ brew services start yabai
```
