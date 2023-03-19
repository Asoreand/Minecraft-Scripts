#!/bin/bash

# Paramaters: directory, world, screen_session
backup() {
   clear
   
   # Source the start script to start the server at the end
   source ./start.sh

   # Destination of the server (/home/minecraft/[SERVER])
   directory=$1

   # Name of the server world file directories (/home/minecraft/server/[WORLDFILE])
   world=$2
 
   # Name of the screen window where the server is running
   screen_session=$3

   # Files to backup
   backup_files="$directory/$world $directory/${world}_nether $directory/${world}_the_end"

   # Destination of the backup
   dest="/home/minecraft/backups"

   # Create archive filname
   date=$(date +%F_%R)
   day=$(date +%A)
   hostname=($world -s)
   archive_file="$hostname-$day-$date.tgz"

   screen_say() {
      local command=$1
      screen -S $screen_session -X stuff "$command"
   }

   # Warn online players that server is restarting in 1 minute
   printf "Informing players that server is restarting.\n"
   for i in {60..1}
   do
      printf "Server will begin backup in $i seconds...\r"
      sleep 1
   done &
   screen_say "say Warning! Server is restarting in 1 minute!^M"
   sleep 10
   screen_say "/save-all^M"
   sleep 40
   screen_say "say Restarting in 10 seconds...^M"
   sleep 5
   for i in {5..1}
   do
      screen_say "say Restarting in $i...^M"
      sleep 1
   done

   # Stopping the server
   screen_say "stop^M"
   printf "\nServer stopped.\n"

   # Print status of the backup
   printf "\nBacking up $backup_files to $dest/$archive_file\n"

   # Back the files to tar file
   tar czf $dest/$archive_file $backup_files

   # Start the server
   start "$directory" "$screen_session"

   # Print finnishing message
   printf "\nBackup Finished\n$date\n"

   # List of all the files in $dest with file sizes
   printf "\nListing all current backups in $dest"
   ls -lh $dest
}