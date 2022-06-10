# Aliases

# System
alias system-show-space="df -h"
alias system-show-space-ncdu="sudo ncdu /"
alias system-show-my-ip="ip add | grep -o \"inet 192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?\" | grep -o \"192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?\""
alias system-show-my-ip-ifconfig="ifconfig | grep -o \"inet 192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?\" | grep -o \"192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?\""

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

if [[ $OS == "Linux" ]]
then
    # Manjaro
    alias system-freeup-space="sudo pacman -Sc && sudo pacman -Qdt && sudo pacman -Rns $(pacman -Qtdq) && sudo journalctl --vacuum-size=50M && yay -Scc && sudo paccache -rvk0"
    alias system-update="sudo pacman -Syu && yay && flatpak upgrade"
    alias pacman-search="pacman -Ss"
    alias pacman-search-installed="pacman -Qs"
    alias pacman-ls-installed="pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"
    alias pacman-install="sudo pacman -Syu"
    alias pacman-uninstall="sudo pacman -Rns"

    echo $OS "aliases loaded"
elif [[ $OS == "OSX" ]]

    echo $OS "aliases loaded"
then

fi

# Configs
alias zsh-reload="source ~/.zshenv && source $ZDOTDIR/.zshrc"
alias tmux-reload="tmux source $XDG_CONFIG_HOME/tmux/tmux.conf"
alias zsh-config="code ~/configs/."

# SSH
## VPS
alias sshvps="ssh $VPS_USER@$VPS_IP"

# VPN
## Wireguard
alias vpn-connect-pi="wg-quick up wg0"
alias vpn-disconnect-pi="wg-quick down wg0"

# Git
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

# Docker
alias docker-show-used-spase="docker system df"
alias docker-remove-all-stopped-containers="docker container prune"
alias docker-remove-all-images="docker image prune -a"
alias docker-remove-all-cache="docker builder prune -a"

# Python
alias python=/usr/local/bin/python3

# Connect to Raspberry Pi
alias sshpi="ssh $PI_PATH"

# VNC
alias vnc-ipad="vncserver -randr=1440x1080"
alias vnc-phone="vncserver -randr=1280x606"
alias vnc-pc="vncserver -randr=1920x1080"
alias vnc-ls="ps -ef | grep \"Xvnc-core \:.\""
alias vnc-rm="zsh $ZSH_CUSTOM/scripts/vnc-rm.sh"

# WORK 
function android-screen() {
    if [ -z "$1" ]
    then 
        scrcpy --turn-screen-off -m 1024
    else 
        scrcpy --turn-screen-off -m 1024 -s "$1"
    fi
}
alias android-list-apps="adb shell 'pm list packages -f' | sed -e 's/.*=//' | sort"
alias android-focused-app="adb shell dumpsys window windows | grep -E 'mFocusedApp'| cut -d / -f 1 | cut -d '"' '"' -f 7"
alias android-clear-cache="adb shell pm clear"
alias android-uninstall="adb shell pm uninstall"
alias android-logs-open="code ~/logs"
alias android-enable-debug-firebase-for="adb shell setprop debug.firebase.analytics.app"
alias android-disable-debug-firebase="adb shell setprop debug.firebase.analytics.app .none."
alias android-all-contacts-count="adb shell content query --uri content://com.android.contacts/contacts | wc -l"
alias android-12-emulator="emulator -avd Pixel_4_API_32 -qemu -no-audio"

function android-connect-adb-wifi() {
    adb kill-server;
    sleep 1;
    echo `adb devices | egrep -o "^([a-z]\w*|[0-9]\w*)\W"`;
    adb -s `adb devices | egrep -o "^([a-z]\w*|[0-9]\w*)\W"` tcpip 5555;
    sleep 1;
    echo `adb shell ip addr show wlan0 | grep -o "inet 192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?" | grep -o "192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?"`;
    adb connect `adb shell ip addr show wlan0 | grep -o "inet 192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?" | grep -o "192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?"`:5555;
}

## LEADer
alias android-leader-install-oldver="adb install ~/Docs/apk/LEADer_old_store_debug.apk"