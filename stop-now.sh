#!/bin/bash

stop-now(){
    clear
    
    # Name of the screen where the server is running
    screen_session=$1
    screen -S $screen_session -X stuff "stop^M"
}