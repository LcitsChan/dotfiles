#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <app_name>"
  exit 1
fi

APP_NAME=$(yabai -m query --windows --window $YABAI_WINDOW_ID | jq -r '.app')

if [[ "$APP_NAME" != "$1" ]]; then
  exit 3
fi

if [[ $APP_NAME == "Notification Center" ]]; then
  exit 2
fi

app_name=$1

app_wins=$(yabai -m query --windows | jq --arg app_name $app_name 'map(select(.app == $app_name))')
app_wins_size=$(echo $app_wins | jq 'length')

if [[ $app_wins_size == 1 ]]; then
  app_main_win=$(echo $app_wins | jq '.[0]')
  is_native_fullscreen=$(echo $app_main_win | jq -re '."is-native-fullscreen"')
  if [[ $is_native_fullscreen == "false" ]]; then
    is_floating=$(echo $app_main_win | jq -re '."is-floating"')
    if [[ $is_floating == "true" ]]; then
      app_main_win_id=$(echo $app_main_win | jq '.id')
      yabai -m window $app_main_win_id --toggle float
    fi
  fi
fi
