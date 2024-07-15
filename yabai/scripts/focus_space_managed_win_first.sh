#!/bin/bash
# fix up navigate to native fullscree app, will focus the float one, such as Arc little win
SPACE_INFO=$(yabai -m query --spaces --space)
is_space_fullscreen=$(echo $SPACE_INFO | jq '."is-native-fullscreen"')
[[ "$is_space_fullscreen" == "false" ]] && exit 0

WINS=$( echo $SPACE_INFO | jq '.windows')
WINS_LEN=$(echo $WINS | jq 'length')
echo $WINS

if [[ "$WINS_LEN" -gt 1 ]]; then
echo $WINS | jq -rc '.[]' | while read -r item; do 
WIN_INFO=$(yabai -m query --windows --window $item)
IS_NATIVE_FULLSCREEN=$(echo $WIN_INFO | jq -r '."is-native-fullscreen"')
[[ $IS_NATIVE_FULLSCREEN == "true" ]] && yabai -m window --focus $(echo $WIN_INFO | jq -r '.id') && exit 0
done
fi

