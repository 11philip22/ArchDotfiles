#!/bin/bash
#written by philip woldhek

DMENU=${DMENU:-dmenu}
cmd_list="no yes"

cmd="$(echo $cmd_list | sed 's/ /\n/g' | ${DMENU} -p 'Are you sure?' -nf '#FF0000' -nb '#31004a' -sf '#ffffff' -sb '#ab00ff' -fn 'terminus:pixelsize=12')"

function safeshutdown() {
 if pgrep -il "vmware-vmx" &>/dev/null;
  then
    notify-send "vm is running!"
  else
    docker stop $(docker ps -aq)
    shutdown now
 fi
}

[[ -z $cmd ]] && exit 1

if [[ $cmd = yes ]]; then
    safeshutdown
else
    exit 0
fi
