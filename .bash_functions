#!/bin/bash

function ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        TITLE=$(echo "$*" | awk '{ print $NF }')
        tmux rename-window "$TITLE"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}

# vim: set ts=4 sw=4 tw=0 ft=sh et :
