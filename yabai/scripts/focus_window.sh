#/bin/sh
export PATH=/usr/local/bin:$PATH

IS_FLOATING=$(yabai -m query --windows --window | jq '."is-floating"')
[[ $IS_FLOATING == "true" ]] && exit 1
case "$1" in
  east)
    yabai -m window --focus east || (yabai -m display --focus next && yabai -m window --focus first)
  ;;
  west)
    yabai -m window --focus west || (yabai -m display --focus prev && yabai -m window --focus last)
  ;;
esac

exit 0
