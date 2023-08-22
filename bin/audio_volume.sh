#!/bin/bash

# constants
MAX_VOLUME=100

# functions
# kill() {
#     kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
# }

notify() {
    kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
    eww open volume-output-widget --screen 0
    sleep 2
    eww close volume-output-widget
}

increase_volume() {
    pamixer --increase 5
}

decrease_volume() {
    pamixer --decrease 5
}

get_volume() {
    volume=$(pamixer --get-volume)
    echo "$volume"
}

get_volume_padded() {
    volume=$(pamixer --get-volume)
    printf "%03d\n" $volume
}

# execution
if [[ "$1" == "--increase" ]]; then
    increase_volume
    notify
    # if [[ "$2" == "--no-notify" ]]; then
    #     exit 0
    # else
    #     notify
    # fi
elif [[ "$1" == "--decrease" ]]; then
    decrease_volume
    notify
    # if [[ "$2" == "--no-notify" ]]; then
    #     exit 0
    # else
    #     notify
    # fi
elif [[ "$1" == "--get" ]]; then
    get_volume
elif [[ "$1" == "--get-pad" ]]; then
    get_volume_padded
fi
