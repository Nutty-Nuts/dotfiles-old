#!/bin/bash
output=$(hyprctl activewindow | grep "initialClass:" | cut -b 16- | sed -e "s/\b\(.\)/\u\1/g")
empty="Hyprland"

if [[ $(hyprctl activewindow | grep "initialClass:" | cut -b 16- | sed -e "s/\b\(.\)/\u\1/g") == "Org.Kde.Dolphin" ]]; then
  echo "Dolphin"
elif [[ $(hyprctl activewindow | grep "initialClass:" | cut -b 16- | sed -e "s/\b\(.\)/\u\1/g") ]]; then
  echo $output
else 
  echo $empty
fi

