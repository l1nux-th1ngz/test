#!/bin/zsh
swaybg --image $(find $HOME/Pictures/Wallpaper -type f | shuf -n 1) -m fill&
function handle {
    if [[ ${1:0:9} == "workspace" ]]; then
        echo $line
        killall swaybg
        swaybg --image $(find $HOME/Pictures/Wallpaper -type f | shuf -n 1) -m fill&
    fi
}

socat - UNIX-CONNECT:/tmp/hypr/.socket2.sock | while read line; do handle $line; done
