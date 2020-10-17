#!/bin/bash

DMENU=${DMENU:-dmenu}
cmd_list="no suspend hibernate"

cmd="$(echo $cmd_list | sed 's/ /\n/g' | ${DMENU} -p 'Are you sure?' -nf '#FF0000' -nb '#31004a' -sf '#ffffff' -sb '#ab00ff' -fn 'terminus:pixelsize=12')"

[[ -z $cmd ]] && exit 1

if [[ $cmd = suspend ]]; then
    systemctl suspend
elif [[ $cmd = hibernate ]]; then
	systemctl hibernate
else
    exit 0
fi

