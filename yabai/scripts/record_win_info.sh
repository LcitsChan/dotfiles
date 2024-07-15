#!/bin/bash
if [[ -e /tmp/current_win_id ]]; then
  recent_win_id=$(cat /tmp/current_win_id)
  echo $recent_win_id > /tmp/recent_win_id
fi
echo $YABAI_WINDOW_ID > /tmp/current_win_id
