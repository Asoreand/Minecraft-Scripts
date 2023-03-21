#!/bin/sh

# Start the minecraft server in a detached screen
start() {
    clear
    
    # Directory where server.jar is located
    directory=$1

    # Name of screen session
    screen_session=$2

    # Amount of RAM to use for the server (2G or 2048M)
    ram=$3

    echo "Starting Minecraft server with $ram ram..."

    cd $directory
    screen -S $screen_session -d -m java -Xmx$ram -jar server.jar nogui
}