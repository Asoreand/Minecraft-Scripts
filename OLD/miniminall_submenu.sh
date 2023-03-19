#!/bin/bash

# Define the menu options
options=(1 "Backup"
         2 "Start"
         3 "Stop with warning"
         4 "Stop now"
	 5 "Back to server select")

# Display the menu and get the user's choice
choice=$(dialog --clear \
                --title "Miniminall" \
                --menu "Select a script to execute:" \
                15 40 5 \
                "${options[@]}" \
                2>&1 >/dev/tty)

# Execute the selected script
case $choice in
    1) /home/minecraft/miniminall/scripts/backup.sh;;
    2) /home/minecraft/miniminall/scripts/start.sh;;
    3) /home/minecraft/miniminall/scripts/stop.sh;;
    4) /home/minecraft/miniminall/scripts/stop-now.sh;;
    5) /home/minecraft/server_manager.sh;;
esac
