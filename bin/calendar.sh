#!/bin/bash

toggle() {
  kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
  eww close audio-panel-widget
  eww open --toggle --screen 0 calendar-widget 
  sleep 3
  eww close calendar-widget
}

cancel-timeout() {
  kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
}

resume-timeout() {
  kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)
  eww close calendar-widget
}

if [[ "$1" == "--toggle" ]]; then
  toggle
elif [[ "$1" == "--cancel-fade" ]]; then
  cancel-timeout
elif [[ "$1" == "--resume-fade" ]]; then
  resume-timeout
fi
