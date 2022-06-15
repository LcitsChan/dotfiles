#/bin/sh
export PATH=/usr/local/bin:$PATH

INDEX=`expr $1 - 1`
FILETER=".[$INDEX]"
SPACE=$(yabai -m query --displays --display | jq '.spaces' | jq $FILETER)
yabai -m space --focus $SPACE
