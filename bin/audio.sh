#!/bin/bash
#
toggle() {
  kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
  eww close calendar-widget
  eww open --toggle --screen 0 audio-panel-widget 
  sleep 3
  eww close audio-panel-widget
}

cancel-timeout() {
  kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
}

resume-timeout() {
  kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
  eww close audio-panel-widget
}

if [[ "$1" == "--toggle" ]]; then
  toggle
elif [[ "$1" == "--cancel-fade" ]]; then
  cancel-timeout
elif [[ "$1" == "--resume-fade" ]]; then
  resume-timeout
fi
