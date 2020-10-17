#!/bin/bash
#written by Philip Woldhek

serverip=$(cat /home/philip/scripts/nicetryfbi.txt | grep serverip | awk '{print $2}')

if [ "[playing]" = "$(mpc | sed -n 2p | awk '{print $1;}')" ]
 then
   mpc -h $serverip pause
   mpc stop
   mpc clear
 else
   mpc clear
   mpc add http://$serverip:8000
   mpc -h $serverip play
   mpc play
fi

