#!/bin/bash

stop() {
    clear
    
    # Screen window in which the server is running
    screen_session=$1

    # Warn online players that it's shutting down in one minute
    printf "Informing players that server is stopping.\n"
    for i in {60..1}
    do
      printf "Server will stop in $i seconds...\r"
      sleep 1
    done &
    screen -S $screen_session -X stuff "say Warning! Server is stopping in 1 minute!^M"
    sleep 10
    screen -S $screen_session -X stuff "/save-all^M"
    sleep 40
    screen -S $screen_session -X stuff "say Stopping in 10 seconds...^M"
    sleep 5
    for i in {5..1}
    do
        screen -S $screen_session -X stuff "say Stopping in $i...^M"
        sleep 1
    done
    sleep 1
    screen -S $screen_session -X stuff "stop^M"
}