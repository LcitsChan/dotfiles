#!/bin/bash
# lalt - p : (yabai -m space --focus prev || yabai -m space --focus last) && ~/.config/yabai/scripts/focus_space_managed_win_first.sh
# lalt - n : (yabai -m space --focus next || yabai -m space --focus first) && ~/.config/yabai/scripts/focus_space_managed_win_first.sh

case "$1" in
  prev)
    SPACE_INFO=$(yabai -m query --spaces --space $1 || yabai -m query --spaces --space last)
  ;;
  next)
    SPACE_INFO=$(yabai -m query --spaces --space $1 || yabai -m query --spaces --space first)
  ;;
  recent)
    SPACE_INFO=$(yabai -m query --spaces --space $1)
  ;;
esac
echo $SPACE_INFO
IS_SPACE_NATIVE_FULLSCREEN=$(echo $SPACE_INFO | jq -r '."is-native-fullscreen"')
echo $IS_SPACE_NATIVE_FULLSCREEN
WINS=$( echo $SPACE_INFO | jq '.windows')
WINS_LEN=$(echo $WINS | jq 'length')

if [[ "$IS_SPACE_NATIVE_FULLSCREEN" == "false" || "$WINS_LEN" -lt 2 ]]; then
case "$1" in
  prev)
    yabai -m space --focus prev || yabai -m space --focus last
  ;;
  next)
    yabai -m space --focus next || yabai -m space --focus first
  ;;
  recent)
    yabai -m space --focus recent
  ;;
esac
else
echo $WINS | jq -rc '.[]' | while read -r item; do 
WIN_INFO=$(yabai -m query --windows --window $item)
IS_NATIVE_FULLSCREEN=$(echo $WIN_INFO | jq -r '."is-native-fullscreen"')
[[ $IS_NATIVE_FULLSCREEN == "true" ]] && yabai -m window --focus $(echo $WIN_INFO | jq -r '.id') && echo $WIN_INFO && exit 0
# ID=$(echo $WIN_INFO | jq -r '.id')
# echo $ID
done
fi

exit 0

[[ $IS_FLOATING == "true" ]] && exit 1
case "$1" in
  prev)
    yabai -m space --focus prev || yabai -m space --focus last
  ;;
  next)
    yabai -m space --focus next || yabai -m space --focus first
  ;;
  recent)
    yabai -m window --focus recent
  ;;
esac

exit 0

