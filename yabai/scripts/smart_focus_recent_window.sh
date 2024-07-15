#!/bin/bash
recent_win_id=-1
if [[ -e /tmp/recent_win_id ]]; then
  recent_win_id=$(cat /tmp/recent_win_id)
fi
yabai -m window --focus $recent_win_id || yabai -m window --focus recent || skhd -k "cmd - 0x30"
