#! /usr/bin/zsh
# written by Philip Woldhek

export VISUAL=vim
export EDITOR="$VISUAL"

export PATH=$PATH:~/.local/bin

if [ -x "$(command -v go)" ]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$(go env GOPATH)/bin
fi

export ZSH="/home/philip/.oh-my-zsh"
ZSH_THEME="philipstheme"
plugins=(git extract)
source $ZSH/oh-my-zsh.sh

# ssh compatible keybinds
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    bindkey  "^[[1~"	beginning-of-line
    bindkey  "^[[4~"	end-of-line
fi

# kubectl autocompletion
if [ -f /usr/bin/kubectl ]; then
    source <(kubectl completion zsh);
fi

function headset() {
    if echo -e "info" | bluetoothctl | grep Missing; then
        echo -e "power on" | bluetoothctl
        sleep 1
        echo -e "connect A0:E6:F8:18:DD:F5" | bluetoothctl
    else
        echo -e "power off" | bluetoothctl
    fi
}

export headset


function autogit() {
    if [[ $# -eq 0 ]]; then
        msg=$(date '+%F_%H:%M:%S')
    else
        msg=$@
    fi

    git add .
    git commit -m "${msg}"
    git push origin master
}

export autogit


function kpndisplay() {
    if [ $HOST = "Philip-T490" ]; then
        xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
               --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
        xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 576x1440 --rotate normal \
               --output DP1 --mode 3440x1440 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DP2 --off
    fi
}

export kpndisplay


function solodisplay() {
    if [ $HOST = "Philip-T490" ]; then
        xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
               --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
    elif [ $HOST = "chaos" ]; then
        xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
	           --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off 
    fi
}

export solodisplay


function bigscreen(){
    if [ $HOST = "chaos" ]; then
        xrandr --output eDP1 --primary --mode 1920x1080 --pos 320x1440 \
               --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 \
               --off --output HDMI2 --mode 2560x1440 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        sleep 1
        xrandr --output eDP1 --off --output DP1 --off --output DP2 --off --output HDMI1 \
               --off --output HDMI2 --mode 2560x1440 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        sleep 1
        xrandr --output eDP1 --primary --mode 1920x1080 --pos 320x1440 \
               --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 \
               --off --output HDMI2 --mode 2560x1440 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        feh --bg-scale pics/wallpaper\ slideshow/2560x1440/space.jpg
    fi
}

export bigscreen

########## aliases ########################################################
alias agenda='gcalcli calm'
alias todo='gcalcli agenda'
alias Ro='sudo pacman -Rscn $(pacman -Qtdq)'
alias rschool='ranger ~/school'
alias rscripts='ranger ~/scripts'
alias rpics='ranger ~/pics'
alias rphone='ranger ~/phone'
alias rshare='ranger ~/share-map'
alias rmount='ranger /mnt'
alias mkdir='mkdir -pv'
alias c='clear'
alias dockercleanse='sudo docker rm -f $(sudo docker ps -a -q) && sudo docker rmi -f $(sudo docker images -q)'
alias dockerclean='sudo docker volume prune && docker image prune -a'
alias sudo='sudo '
alias warpnet='cd /home/philip/school/stage-warpnet'
alias school='cd /home/philip/school/school'
alias scripts='cd /home/philip/scripts'
alias downloads='cd /home/philip/Downloads'
alias r='ranger'
alias mnt='cd /mnt'
alias share='cd /home/philip/share-map'
alias rdwm='ranger /home/philip/.config/dwm'
alias gdwm='cd /home/philip/.config/dwm'
alias m='sudo bash /home/philip/scripts/dmenumount.sh'
alias github='cd /home/philip/share-map/github'
alias 3tb='cd /srv/sto3'
alias raid='cd /srv/sto1'
alias 4tb='cd /srv/sto2'
alias nano='vim'
alias mktar='tar -czvf'
alias sto1='cd /srv/sto1'
alias sto2='cd /srv/sto2'
alias sto3='cd /srv/sto3'
alias sto4='cd /srv/sto4'
alias devel='cd /home/philip/devel'
alias deluxe='cd /home/philip/devel/deluxe'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias liah='ls -liah'
alias pull='git pull origin master'
alias code='codium'
alias pip='pip3'
