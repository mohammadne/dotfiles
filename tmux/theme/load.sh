#!/bin/bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function set() {
   tmux set-option -gq "$1" "$2"
}

function setw() {
   tmux set-window-option -gq "$1" "$2"
}

source $current_dir/colors/"$1".conf # load colorscheme
source $current_dir/styles/"$2".sh # load style

# message infos
set "message-style"         "fg=foreground,bg=background,bold" # status line messages style
set "message-command-style" "fg=foreground,bg=background,bold" # in command mode with vi keys

# clock configuration ( prefix + t )
setw "clock-mode-colour" "$active"
setw "clock-mode-style " "24"

# set inactive/active pane border style
set "pane-active-border-style" "fg=$active"
set "pane-border-style"        "fg=$inactive"

# set inactive/active (number) panes styles ( prefix + q )
set "display-panes-active-colour" "$active"
set "display-panes-colour" "$inactive"

# main style of each pane
set "window-active-style" "fg=$foreground,bg=default"
set "window-style" "fg=$inactive,bg=default"

# inactive (empty space) status style
set "status-style" "fg=$background,bg=$background"
