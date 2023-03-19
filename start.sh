#!/bin/sh

# Start the minecraft server in a detached screen with 2GB RAM
start() {
    clear
    
    # Directory where server.jar is located
    directory=$1

    # Name of screen session
    screen_session=$2

    echo "Starting Minecraft server..."

    cd $directory
    screen -S $screen_session -d -m java -Xmx2G -jar server.jar nogui
}