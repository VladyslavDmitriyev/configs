# Aliases

# General
alias zsh-reload="exec zsh && source ~/.zshrc"
alias tmux-reload="tmux source ~/.tmux.conf"

alias zsh-config="vim ~/.zshrc"
alias zsh-aliases="vim $ZSH_CUSTOM/aliases.zsh"
alias notes="vim ~/notes/notes.md"
alias vim-config="vim ~/.vimrc"
alias tmux-config="vim ~/.tmux.conf"

# Open in code
alias zsh-config-code="code ~/.zshrc"
alias zsh-aliases-code="code $ZSH_CUSTOM/aliases.zsh"
alias scripts-code="code ~/bin"
alias notes-code="code ~/notes/notes.md"
alias vim-config-code="code ~/.vimrc"
alias tmux-config-code="code ~/.tmux.conf"

# Manjaro
alias pacman-search="pacman -Ss"
alias pacman-search-installed="pacman -Qs"
alias pacman-ls-installed="pacman -Ql"
alias pacman-update="sudo pacman -Syu"
alias pacman-install="sudo pacman -Syu"
alias pacman-uninstall="sudo pacman -Rns"

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
## LEADer
alias android-leader-install-oldver="adb install ~/Docs/apk/LEADer_old_store_debug.apk"
