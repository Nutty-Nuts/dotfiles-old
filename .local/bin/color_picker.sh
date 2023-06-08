#!/bin/bash

get_output() {
  echo $(wl-paste)
}

color_picker_hex() {
  hyprpicker -a -f hex
}

color_picker_rgb() {
  hyprpicker -a -f rgb
}

if [[ "$1" == "--hex" ]]; then
  color_picker_hex
elif [[ "$1" == "--rgb" ]]; then
  color_picker_rgb
fi

output=$(get_output)

dunstify "Color Coppied" "$output"
