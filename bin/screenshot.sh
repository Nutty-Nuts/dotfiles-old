#!/bin/bash

# function
notify_save() {
  play -v 4 /home/mainuser/.local/sfx/shutter.mp3 &
  dunstify "Screenshot Taken" "Saved to Files" -i /home/mainuser/.local/share/icons/Colloid/devices/scalable/blueman-camera.svg &
}

notify_clip() {
  play -v 4 /home/mainuser/.local/sfx/shutter.mp3 &
  dunstify "Screenshot Taken" "Coppied to Clipboard" -i /home/mainuser/.local/share/icons/Colloid/devices/scalable/blueman-camera.svg &
}

fullscreen_clip() {
  sleep 0.75
  grim - | wl-copy
  notify_clip
}

area_clip() {
  grim -g "$(slurp)" - | wl-copy 
  notify_clip
}

fullscreen_save() {
  sleep 0.75
  grim
  notify_save
}

area_save() {
  grim -g "$(slurp)" 
  notify_save
}

# execution
if [[ "$1" == "--fullscreen-clip" ]]; then
    fullscreen_clip
elif [[ "$1" == "--area-clip" ]]; then
    area_clip
elif [[ "$1" == "--fullscreen-save" ]]; then
    fullscreen_save
elif [[ "$1" == "--area-save" ]]; then
    area_save
fi

