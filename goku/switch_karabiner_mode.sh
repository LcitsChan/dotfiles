#!/bin/bash

mode=$(/Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --show-current-profile-name)
if [[ $mode == "Default" ]]; then
  /Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --select-profile Gaming
  yabai -m config active_window_border_color 0xffffffff && yabai -m config window_border on && yabai -m config window_border_width 4

else
  /Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --select-profile Default
  yabai -m config window_border off && yabai -m config window_border_width 8
fi
