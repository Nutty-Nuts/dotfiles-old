#!/usr/bin/env bash

dunstify "Getting list of available Wi-Fi networks..." -i /home/mainuser/.local/share/icons/Colloid/devices/scalable/gnome-dev-wavelan.svg
# Get a list of available wifi connections and morph it into a nice-looking list
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󱘖  Enable Wi-Fi"
fi

# Use rofi to select wifi network
chosen_network=$(echo -e "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p " 󰖩  WiFi Menu " -theme-str '@import "wifi.rasi"' -columns 1 )
# chosen_network=$(echo -e "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p " 󰖩 SSID ")
# Get name of connection
chosen_id=$(echo "${chosen_network:3}" | xargs)

if [ "$chosen_network" = "" ]; then
	exit
elif [ "$chosen_network" = "󱘖  Enable Wi-Fi" ]; then
	nmcli radio wifi on
elif [ "$chosen_network" = "  Disable Wi-Fi" ]; then
	nmcli radio wifi off
else
	# Message to show when connection is activated successfully
	success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && dunstify "Connection Established" "$success_message" -i /home/mainuser/.local/share/icons/Colloid/devices/scalable/gnome-dev-wavelan.svg
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "   Password " -theme-str '@import "password.rasi"')
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && dunstify "Connection Established" "$success_message" -i /home/mainuser/.local/share/icons/Colloid/devices/scalable/gnome-dev-wavelan.svg
	fi
fi