#!/bin/bash
#written by philip woldhek

DMENU=${DMENU:-dmenu}
cmd_list="remote local"

cmd="$(echo $cmd_list | sed 's/ /\n/g' | ${DMENU} -p ncmpcpp -nf '#FF0000' -nb '#31004a' -sf '#ffffff' -sb '#ab00ff' -fn 'terminus:pixelsize=12')"
[[ -z $cmd ]] && exit 1

if [[ $cmd = local ]]; then
	urxvt -e ncmpcpp --host=localhost
else
        urxvt -e ncmpcpp
fi
