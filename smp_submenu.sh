#!/bin/bash

source ./backup.sh
source ./start.sh
source ./stop.sh
source ./stop-now.sh

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
    1) backup "/home/minecraft/smp" "smp" "smp";;
    2) start "/home/minecraft/smp" "smp";;
    3) stop "smp";;
    4) stop-now "smp";;
    5) /home/minecraft/server_manager.sh;;
esac