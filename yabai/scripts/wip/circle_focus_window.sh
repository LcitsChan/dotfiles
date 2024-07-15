#!/bin/bash

WINS_INFO=$(yabai -m query --windows | jq 'map({id, "has-focus"}) | sort_by(.id)')
WINS_LEN=$(echo $WINS_INFO | jq 'length')
echo $WINS_INFO
[[ $WINS_LEN -lt 2 ]] && exit 0
# TODO
FOCUSED_ID=$(echo $WINS_INFO | jq 'map(select(."has-focus" == true)) | .[0] | .id' || echo "NOT_FOUND")
if [[ "$FOCUSED_ID" == "NOT_FOUND" ]]; then
  FOCUSED_ID=$(echo $WINS_INFO | jq '.[0] | .id')
else
  # echo $(echo $WINS_INFO | jq -r '.[] | .id')
  FOCUSED_ID=$(echo $WINS_INFO | jq -r '.[] | .id' | (while read -r item; do 
    if [[ "$item" -gt "$FOCUSED_ID" ]]; then
      echo $item
      exit
    fi
  done && echo "LASTEST"))
fi
if [[ "$FOCUSED_ID" == "LASTEST" ]]; then
  FOCUSED_ID=$(echo $WINS_INFO | jq '.[0] | .id')
fi
yabai -m window --focus $FOCUSED_ID
