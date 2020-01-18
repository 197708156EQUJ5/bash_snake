#!/bin/bash

source lib/utils
source lib/board
source lib/cursor_move

function main() {
    echo "Welcome to Snake"
    init_screen
    trap refresh_board ALRM
    refresh_board
    while :
    do
        read -s -n 1 key
        
        if [[ $key = q ]]; then
            goodbye
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

main
