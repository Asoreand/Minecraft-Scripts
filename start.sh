#!/bin/sh

# Start the minecraft server in a detached screen with 2GB RAM
start() {
    # Directory where server.jar is located
    directory=$1

    # Name of screen session
    screen_session=$2

    cd "$directory"
    screen -S $screen_session -d -m java -Xmx2G -jar server.jar nogui
}