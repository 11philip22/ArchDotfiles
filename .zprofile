[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi

bash /usr/bin/tdm

XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME
