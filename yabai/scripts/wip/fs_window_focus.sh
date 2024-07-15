#!/bin/bash

# WINS=$(yabai -m query --windows --space | jq 'map({id, x: .frame.x, y: .frame.y, "has-focus"} | select(."has-focus" == false)) | sort_by(.x)')
yabai -m window --focus $1 && exit 0
WINS=$(yabai -m query --windows --space | jq 'map({id, x: .frame.x, y: .frame.y, "has-focus"})')
WINS_NO_FOCUS=$(echo $WINS | jq -r 'map(select(."has-focus" == false))')
WIN_FOCUSED=$(echo $WINS | jq -r 'map(select(."has-focus" == true)) | .[0]')
# TODO: No window was focused
if [[ "$1" == "west" ]]; then
	OFFSET=$(echo $WIN_FOCUSED | jq -r '.x')
	WIN_NEXT=$(echo $WINS_NO_FOCUS | jq -r --arg offset $OFFSET 'map(select(.x < ($offset | tonumber))) | sort_by(-.x) | .[0]')
	echo $WIN_NEXT
elif [[ "$1" == "east" ]]; then
	OFFSET=$(echo $WIN_FOCUSED | jq -r '.x')
	WIN_NEXT=$(echo $WINS_NO_FOCUS | jq -r --arg offset $OFFSET 'map(select(.x > ($offset | tonumber))) | sort_by(.x) | .[0]')
elif [[ "$1" == "north" ]]; then
	OFFSET=$(echo $WIN_FOCUSED | jq -r '.y')
	WIN_NEXT=$(echo $WINS_NO_FOCUS | jq -r --arg offset $OFFSET 'map(select(.y < ($offset | tonumber))) | sort_by(-.y) | .[0]')
elif [[ "$1" == "south" ]]; then
	OFFSET=$(echo $WIN_FOCUSED | jq -r '.y')
	WIN_NEXT=$(echo $WINS_NO_FOCUS | jq -r --arg offset $OFFSET 'map(select(.y > ($offset | tonumber))) | sort_by(.y) | .[0]')
fi
# FOCUS_ID=$(echo $WINS | jq -rc --arg idx $INDEX '.[$idx | tonumber] | .id')
WIN_NEXT_ID=$(echo $WIN_NEXT | jq -r '.id')
yabai -m window --focus $WIN_NEXT_ID
echo "$WINS \n$WINS_NO_FOCUS \n$WIN_NEXT \n$WIN_NEXT_ID" >>/tmp/yabai_window.log
# case "$1" in
# east)
# 	yabai -m window --focus $WIN_NEXT_ID || (yabai -m display --focus next && yabai -m window --focus first)
# 	;;
# west)
# 	yabai -m window --focus $WIN_NEXT_ID || (yabai -m display --focus prev && yabai -m window --focus last)
# 	;;
# esac
