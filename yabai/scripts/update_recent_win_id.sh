#!/bin/bash
last_window_id=$(cat /tmp/current_window_id)
yabai -m window --focus $last_window_id || yabai -m window --focus recent || skhd -k "cmd - 0x30"
echo $1 > /tmp/current_window_id

