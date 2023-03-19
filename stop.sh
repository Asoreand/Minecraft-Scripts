#!/bin/bash

stop() {
    clear
    
    # Screen window in which the server is running
    screen_session=$1

    # Warn online players that it's closing in one minute
    screen -S $screen_session -X stuff "say Warning! Server is shutting down in 1 minute!^M"
    sleep 10
    screen -S $screen_session -X stuff "/save-all^M"
    sleep 40
    screen -S $screen_session -X stuff "say Shutting down in 10 seconds...^M"
    sleep 5
    for i in {5..1}
    do
        screen -S $screen_session -X stuff "say Shutting down in $i...^M"
        sleep 1
    done
    sleep 1
    screen -S $screen_session -X stuff "stop^M"
}