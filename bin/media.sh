#!/bin/bash

# functions
play-pause() {
    playerctl play-pause  
}

play() {
    playerctl play  
}

pause() {
    playerctl pause  
}

next() {
    playerctl next  
}

previous() {
    playerctl previous  
}

# execution
if [[ "$1" == "--toggle" ]]; then
    play-pause
elif [[ "$1" == "--pause" ]]; then
    pause
elif [[ "$1" == "--play" ]]; then
    play
elif [[ "$1" == "--next" ]]; then
    next
elif [[ "$1" == "--previous" ]]; then
    previous
fi
