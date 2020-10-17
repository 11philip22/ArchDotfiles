#!/bin/bash
#written by philip woldhek

DMENU=${DMENU:-dmenu}
cmd_list="no yes"
cmd="$(echo $cmd_list | sed 's/ /\n/g' | ${DMENU} -p 'Exit i3?' -nf '#FF0000' -nb '#31004a' -sf '#ffffff' -sb '#ab00ff' -fn 'terminus:pixelsize=12')"

[[ -z $cmd ]] && exit 1

if [[ $cmd = yes ]]; then
    i3-msg exit
else
    exit 0
fi