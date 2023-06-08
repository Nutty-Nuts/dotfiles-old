#!/bin/bash

chosen=$(printf "Screen\nSelection\n" | rofi -p "   Screenshot " -dmenu -i -theme-str '@import "screenshot.rasi"')

case "$chosen" in
    "Screen") /home/mainuser/.local/bin/screenshot.sh --fullscreen-save;;
    "Selection") /home/mainuser/.local/bin/screenshot.sh --area-save;;
    *) exit 1 ;;
esac
