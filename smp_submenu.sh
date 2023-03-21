#!/bin/bash

# Destination of the server (/home/minecraft/[SERVER_FOLDER])
directory=/home/minecraft/smp

# Name of the world files (Also called "level-name" in server.properties)
world=smp
 
# Name of the screen window where the server is running
screen_session=smp

# Amount of RAM to use for the server (2G or 2048M)
ram="5G"

source /home/minecraft/scripts/backup.sh
source /home/minecraft/scripts/start.sh
source /home/minecraft/scripts/stop.sh
source /home/minecraft/scripts/stop-now.sh

# Define the menu options
options=(1 "Backup"
         2 "Start"
         3 "Stop with warning"
         4 "Stop now"
	     5 "Back to server select")

# Display the menu and get the user's choice
choice=$(dialog --clear \
                --title "SMP" \
                --menu "Select a script to execute:" \
                15 40 5 \
                "${options[@]}" \
                2>&1 >/dev/tty)

# Execute the selected script
case $choice in
    1) backup "$directory" "$world" "$screen_session" "$ram";;
    2) start "$directory" "$screen_session" "$ram";;
    3) stop "$screen_session";;
    4) stop-now "$screen_session";;
    5) /home/minecraft/scripts/server_manager.sh;;
esac