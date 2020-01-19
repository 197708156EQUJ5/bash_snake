#!/bin/bash
## ==============================================
## @file: snake.sh

source lib/utils
source lib/board
source lib/constants
source lib/cursor_move

base=`basename "$0"`

## ----------------------------------------------
## @name main()
##
## runs the main execution of the snake game
##
## ----------------------------------------------
function main() {
    create_logger
    clear
    hide_cursor
    clear_screen
    init_screen
    trap refresh_board ALRM
    trap quit INT
    refresh_board
    while :
    do
        read -s -n 1 key
        
        if [[ $key = q ]]; then
            quit
            break
        elif [[ $key = a ]]; then
            change_direction 4
        elif [[ $key = s ]]; then
            change_direction 3
        elif [[ $key = d ]]; then
            change_direction 2
        elif [[ $key = w ]]; then
            change_direction 1
        fi
    done
}

if [[ "$1" = "list_func" ]]; then
    showDocs
    exit
fi

main

## END snake.sh
## ==============================================
