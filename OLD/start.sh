#!/bin/sh

clear

# Start the minecraft server in a detached screen with 16GB RAM
cd /home/minecraft/miniminall
screen -S miniminall -d -m java -Xmx16G -jar server.jar nogui
