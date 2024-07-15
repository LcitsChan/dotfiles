#!/bin/bash
win_info=$(yabai -m query --windows --window | jq '{app, id}')
win_app_name=$(echo $win_info | jq -r '.app')
win_app_id=$(echo $win_info | jq -r '.id')
WIN_IDS=$(yabai -m query --windows | jq --arg app_name $win_app_name 'map(select(.app == $app_name) | .id) | sort_by(.)')
length=$(echo $WIN_IDS | jq 'length')
(( $length == 1 )) && exit 0

# 使用子 shell 执行 jq 和 while 循环，并捕获 FOCUS_ID
FOCUS_ID=$(echo "$WIN_IDS" | jq -r '.[]' | (while read -r item; do
  if [ "$item" -gt "$win_app_id" ]; then
    # 尝试聚焦窗口
    # yabai -m window --focus "$item"
    echo "$item"  # 将找到的 ID 输出到子 shell
    exit  # 退出 while 循环
  fi
done && echo "not found"))  # 如果没有找到，输出 "not found"

# 根据 FOCUS_ID 的值输出相应消息
if [ -n "$FOCUS_ID" ]; then
  if [ "$FOCUS_ID" = "not found" ]; then
    FOCUS_ID=$(echo $WIN_IDS | jq -r '.[0]')
  fi
fi

yabai -m window --focus $FOCUS_ID

