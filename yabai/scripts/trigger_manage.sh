#!/bin/bash

# TODO 这条脚本可以排除特定应用
exclude_app=""

# 获取当前应用程序的名称
current_app_info=$(yabai -m query --windows --window)
current_app=^$(echo $current_app_info | jq -r '.app')\$
current_app_is_manage=$(echo $current_app_info | jq -r '."is-floating"')
default_grid=grid\=12:8:1:1:6:10

# 根据 is-floating 的值设置 new_manage
if [ "$current_app_is_manage" == "true" ]; then
    old_manage="manage=off"
    new_manage="manage=on"
    yabai -m rule --add app="$current_app" label="$current_app" $new_manage
else
    old_manage="manage=on"
    new_manage="manage=off"
    yabai -m rule --add app="$current_app" label="$current_app" $new_manage $default_grid
fi

if [[ "title" == $1 ]]; then
  current_win_title=$(echo " title=\"$(echo "$current_app_info" | jq -r '.title')\"" | gsed 's#\/#\\/#g')
fi
#
# yabairc_path=~/.config/yabai/scripts/manage_list.sh
#
# # 定义注释
# comment="# The following window configuration is automatically added by triggering a shortcut for the script."
#
# # 检查是否已存在相同规则
# match_app_rule="yabai -m rule --add app=\"$current_app\"$current_win_title"
#
# existing_rule=$(grep "$match_app_rule" $yabairc_path)
#
# if [ -z "$existing_rule" ]; then
#     # 在注释之后插入规则
#     gsed -i.bak "/$comment/a $match_app_rule $new_manage" $yabairc_path
#     # echo "Rule added to .yabairc: $match_app_rule $new_manage"
# else
#     # 如果规则存在，替换已存在的规则中的 manage=on 为 manage=off
#     gsed -i.bak "s/\($match_app_rule\)\(.*\)\($old_manage\)\(.*\)/\1\2$new_manage\4/" $yabairc_path
#     # echo "Rule updated in .yabairc: $match_app_rule $new_manage"
# fi
#
# if [[ $new_manage == "manage=on" ]]; then
#   gsed -i.bak "s/\($match_app_rule\)\(.*\)\( $default_grid\)/\1\2/" $yabairc_path
# else
#   gsed -i.bak "s/\($match_app_rule\)\(.*\)/\1\2 $default_grid/" $yabairc_path
# fi
#
# if [[ "title" == $1 ]]; then
#   final_rule=$(grep "$match_app_rule" $yabairc_path)
# else
#   final_rule=$(grep "$match_app_rule" $yabairc_path | grep -v "title")
# fi
# echo "Final rule: $final_rule"
# eval $final_rule
