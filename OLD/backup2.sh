#!/bin/bash

clear

# Screen window in which the server is running
screen_session="miniminall"

# Files to backup
backup_files="/home/minecraft/miniminall/miniminall /home/minecraft/miniminall/miniminall_nether /home/minecraft/miniminall/miniminall_the_end"

# Destination of the files
dest="/home/minecraft/backups"

# Create archive filname
date=$(date +%F_%R)
day=$(date +%A)
hostname=(Miniminall -s)
archive_file="$hostname-$day-$date.tgz"

# Warn online players that server is restarting
echo "Informing players that server is restarting."
echo "Server will begin backup in 60 seconds."
screen -S $screen_session -X stuff "say Warning! Server is restarting in 1 minute!^M"
sleep 10
screen -S $screen_session -X stuff "/save-all^M"
sleep 40
screen -S $screen_session -X stuff "say Restarting in 10 seconds...^M"
sleep 5
for i in {5..1}
do
   screen -S $screen_session -X stuff "say Restarting in $i...^M"
   sleep 1
done

# Stopping the server
screen -S $screen_session -X stuff "stop^M"
echo "Server stopped."

# Print status of the backup
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Back the files to tar file
tar czf $dest/$archive_file $backup_files

# Print finnishing message
echo
echo "Backup Finished"
date

# List of all the files in $dest with file sizes
echo "Listing all current backups in $dest"
ls -lh $dest

# Start server
echo
echo "Starting server..."
echo
sh /home/minecraft/miniminall/scripts/start.sh
