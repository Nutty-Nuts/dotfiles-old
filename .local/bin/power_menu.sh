
#!/bin/bash

# chosen=$(printf " Power Off\n Restart\n󰍃 Logout\n󰤄 Suspend" | rofi -dmenu -i -theme-str '@import "power.rasi"')

# power="~/.local/menuicons/power-outline.svg"
# restart="~/.local/menuicons/refresh.svg"
# logout="~/.local/menuicons/log-out-outline.svg"
# suspend="~/.local/menuicons/moon-outline.svg"

chosen=$(echo -en " Power Off\x0icon\x1f${power}\n Restart\x0icon\x1f${restart}\n Log Out\x0icon\x1f${logout}\n Suspend\x0icon\x1f${suspend}\n" | rofi -p " 󰤁 Power Menu " -dmenu -theme-str '@import "power.rasi"')

case "$chosen" in
    " Power Off") poweroff ;;
    " Restart") reboot ;;
    " Log Out") hyprctl dispatch exit ;;
    " Suspend") systemctl suspend ;;
    *) exit 1 ;;
esac

