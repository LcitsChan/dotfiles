#!/bin/bash

current_app_info=$(yabai -m query --windows --window)
frame=$(echo $current_app_info | jq -r '.frame')
win_x=$(echo $frame | jq -r '.x')
win_half_width=$(($(echo $frame | jq -r '.w') / 2))
win_y=$(echo $frame | jq -r '.y')
click_x=$(expr $win_x + $win_half_width)
click_y=$(($win_y + 10))
current_p=$(/usr/local/bin/cliclick p)
/usr/local/bin/cliclick dc:$click_x,$click_y
/usr/local/bin/cliclick m:$current_p

