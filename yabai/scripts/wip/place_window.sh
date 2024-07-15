#!/bin/bash

WINDOW_INFO=$(yabai -m query --windows --window)
IS_FLOATING=$(echo $WINDOW_INFO | jq -r '."is-floating"')
if [[ "$IS_FLOATING" == "false" ]]; then
  yabai -m window --toggle float
  WINDOW_INFO=$(yabai -m query --windows --window)
fi

# RISIZE_CMD="2:2:0:0:2:2"
RISIZE_CMD=$1

IFS=':' read -r SW SH X Y W H <<< "$RISIZE_CMD"

WINDOW=$(echo $WINDOW_INFO | jq '.frame')
# TODO CHECK FLOATING
DISPLAY=$(yabai -m query --displays --display)
DISPLAY_W=$(echo $DISPLAY | jq '.frame | .w')
DISPLAY_H=$(echo $DISPLAY | jq '.frame | .h')
WINDOW_START_X=$(echo $WINDOW | jq '.x')
WINDOW_START_Y=$(echo $WINDOW | jq '.y')
WINDOW_W=$(echo $WINDOW | jq '.w')
WINDOW_H=$(echo $WINDOW | jq '.h')

DISPLAY_START_X=0
DISPLAY_START_Y=0
DISPLAY_END_X=$DISPLAY_W
DISPLAY_END_Y=$DISPLAY_H

WINDOW_END_X=$(expr $WINDOW_START_X + $WINDOW_W)
WINDOW_END_Y=$(expr $WINDOW_START_Y + $WINDOW_H)
# TODO
START_X=$(( $X * $DISPLAY_W / $SW ))
START_Y=$(( $Y * $DISPLAY_H / $SH ))
END_X=$(( ($X + $W) * $DISPLAY_W / $SW ))
END_Y=$(( ($Y + $H) * $DISPLAY_H / $SH ))


BOTTOM_OFFSET=$(expr $END_Y - $WINDOW_END_Y)
RIGHT_OFFSET=$(expr $END_X - $WINDOW_END_X)
TOP_OFFSET=$(expr $START_Y - $WINDOW_START_Y)
LEFT_OFFSET=$(expr $START_X - $WINDOW_START_X)

yabai -m window --resize bottom_right:$RIGHT_OFFSET:$BOTTOM_OFFSET
yabai -m window --resize top_left:$LEFT_OFFSET:$TOP_OFFSET
