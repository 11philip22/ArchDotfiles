#!/bin/bash
#written by philip woldhek

DMENU=${DMENU:-dmenu}
cmd_list="no yes"

cmd="$(echo $cmd_list | sed 's/ /\n/g' | ${DMENU} -p 'Are you sure?' -nf '#FF0000' -nb '#31004a' -sf '#ffffff' -sb '#ab00ff' -fn 'terminus:pixelsize=12')"

function safereboot() {
 if pgrep -il "vmware-vmx" &>/dev/null;
  then
    notify-send "vm is running!"
  else
    docker stop $(docker ps -aq)
    reboot
 fi
}


[[ -z $cmd ]] && exit 1

if [[ $cmd = yes ]]; then
    safereboot
else
    exit 0
fi

