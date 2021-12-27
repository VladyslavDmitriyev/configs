# Aliases

# System
alias system-show-space="df -h"
alias system-show-space-ncdu="sudo ncdu /"
alias system-show-my-ip="ip add | grep -o \"inet 192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?\" | grep -o \"192.168.[0-9][0-9]\?[0-9]\?.[0-9][0-9]\?[0-9]\?\""
alias system-freeup-space="sudo pacman -Sc && sudo pacman -Qdt && sudo pacman -Rns $(pacman -Qtdq) && sudo journalctl --vacuum-size=50M && yay -Scc && sudo paccache -rvk0"
alias system-update="sudo pacman -Syu && yay && flatpak upgrade"


# Configs
alias zsh-reload="exec zsh && source ~/.zshrc"
alias tmux-reload="tmux source ~/.tmux.conf"
alias zsh-config="code ~/configs/."

# Manjaro
alias pacman-search="pacman -Ss"
alias pacman-search-installed="pacman -Qs"
alias pacman-ls-installed="pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"
alias pacman-install="sudo pacman -Syu"
alias pacman-uninstall="sudo pacman -Rns"

# VPN
## Wireguard
alias vpn-connect-pi="wg-quick up wg0"
alias vpn-disconnect-pi="wg-quick down wg0"

# Docker
alias docker-show-used-spase="docker system df"
alias docker-remove-all-stopped-containers="docker container prune"
alias docker-remove-all-images="docker image rm $(docker image ls -q)"

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
alias android-screen="scrcpy --turn-screen-off -m 1024"
alias android-list-apps="adb shell 'pm list packages -f' | sed -e 's/.*=//' | sort"
alias android-focused-app="adb shell dumpsys window windows | grep -E 'mFocusedApp'| cut -d / -f 1 | cut -d '"' '"' -f 7"
alias android-clear-cache="adb shell pm clear"
alias android-uninstall="adb shell pm uninstall"
alias android-logs-open="code ~/logs"
alias android-enable-debug-firebase-for="adb shell setprop debug.firebase.analytics.app"
alias android-disable-debug-firebase="adb shell setprop debug.firebase.analytics.app .none."
alias android-all-contacts-count="adb shell content query --uri content://com.android.contacts/contacts | wc -l"
## LEADer
alias android-leader-install-oldver="adb install ~/Docs/apk/LEADer_old_store_debug.apk"
