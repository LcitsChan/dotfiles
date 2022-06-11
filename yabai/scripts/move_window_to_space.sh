WIN_INFO=$(yabai -m query --windows --window)
IS_FULLSCREEN=$(echo $WIN_INFO | jq '."is-native-fullscreen"')
[[ $IS_FULLSCREEN == "true" ]] && exit
WIN_ID=$(echo $WIN_INFO | jq .id)
yabai -m display --focus $1 || exit
SPACE=$(yabai -m query --spaces --space | jq .index)
yabai -m window --focus $WIN_ID
yabai -m window --space $SPACE
yabai -m window --focus $WIN_ID
