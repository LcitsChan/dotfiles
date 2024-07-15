#/bin/sh
export PATH=/usr/local/bin:$PATH

INDEX=`expr $1 - 1`
FILETER=".[$INDEX]"
SPACE=$(yabai -m query --displays --display | jq '.spaces' | jq $FILETER)
echo "yabai -m space --focus $SPACE"
yabai -m space --focus $SPACE
