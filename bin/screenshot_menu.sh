#!/bin/bash

chosen=$(printf "Screen\nSelection\n" | rofi -p "   Screenshot " -dmenu -i -theme-str '@import "screenshot.rasi"')

case "$chosen" in
    "Screen") ~/.local/bin/screenshot.sh --fullscreen-save ;;
    "Selection") ~/.local/bin/screenshot.sh --area-save ;;
    *) exit 1 ;;
esac
