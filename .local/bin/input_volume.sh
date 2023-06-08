#!/bin/bash

#functions
notify() {
  kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
  eww open volume-input-widget --screen 0
  sleep 2
  eww close volume-input-widget
}

increase_volume() {
    pamixer --default-source --increase 5 
}

decrease_volume() {
    pamixer --default-source --decrease 5 
}

get_volume() {
    volume=$(pamixer --default-source --get-volume)
    echo "$volume"
}

get_volume_padded() {
  volume=$(pamixer --default-source --get-volume)
  printf "%03d\n" $volume
}

# execution
if [[ "$1" == "--increase" ]]; then
    increase_volume
    notify
elif [[ "$1" == "--decrease" ]]; then
    decrease_volume
    notify
elif [[ "$1" == "--get" ]]; then
    get_volume
elif [[ "$1" == "--get-pad" ]]; then
  get_volume_padded
fi
