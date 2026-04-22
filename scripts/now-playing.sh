#!/usr/bin/env bash

status() {
    while true
    do
       while pgrep spotify > /dev/null
       do
           album=~/.cache/album.png

           if [ "$artist"!="$(playerctl metadata artist)" ]
           then
               artist="$(playerctl metadata artist)"
           fi

           if [ "$title"!="$(playerctl metadata title)" ]
           then
               title="$(playerctl metadata title)"
           fi

           if [ "$artUrl"!=$(playerctl metadata | grep artUrl | awk '{ print $3 }') ]
           then
               artUrl=$(playerctl metadata | grep artUrl | awk '{ print $3 }')
              # curl -o $album $artUrl
           fi

           if [ "$output"!="$title - $artist" ]
           then
               output="$title - $artist"
               echo $output
           fi
           sleep 5
       done
       sleep 10
    done
}

case $1 in
    "") status ;;
esac
