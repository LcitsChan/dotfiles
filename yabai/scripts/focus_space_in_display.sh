#/bin/sh
export PATH=/usr/local/bin:$PATH

case "$2" in
  first) echo 1
  INDEX=0
  ;;
  last) echo 2 or 3
  INDEX=-1
  ;;
  *)
  INDEX=`expr $2 - 1`
  ;;
esac

FILETER=".[$INDEX]"
SPACE=$(yabai -m query --displays --display $1 | jq '.spaces' | jq $FILETER)
yabai -m space --focus $SPACE
