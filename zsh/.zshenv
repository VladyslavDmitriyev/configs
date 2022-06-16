#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export PATH=$PATH:~/bin

case "$OSTYPE" in
    solaris*) OS="SOLARIS" ;;
    darwin*)  OS="OSX" ;; 
    linux*)   OS="LINUX" ;;
    bsd*)     OS="BSD" ;;
    msys*)    OS="WINDOWS" ;;
    cygwin*)  OS="ALSO WINDOWS" ;;
    *)        OS="unknown: $OSTYPE" ;;
esac

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export SECRETS_PATH="~/.config/zsh/.secrets"

# editor
export EDITOR="code"
export VISUAL="code"

# other software
export TMUXDOTDIR="$XDG_CONFIG_HOME/tmux"

if [[ $OS == "Linux" ]]
then
    export JAVA_HOME=/usr/lib/jvm/default
    export ANDROID_HOME=~/AndroidSDK
    export ANDROID_SDK_ROOT=~/AndroidSDK
    echo $OS "variables exported"
elif [[ $OS == "OSX" ]]
then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_312` #/usr/local/opt/openjdk@8
    export ANDROID_HOME=~/Library/Android/sdk
    export ANDROID_SDK_ROOT=~/Library/Android/sdk
    echo $OS "variables exported"

    if [[ `uname -m` == "arm64" ]]
    then
        eval $(/opt/homebrew/bin/brew shellenv)
        export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_312`
        echo "JAVA_HOME for" `uname -m` "was exported"
        export PATH="$PATH:/Users/vlad/dev/flutter/bin"
    else
        export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_312`
        echo "JAVA_HOME for Intel was exported"
    fi
fi

# WORK
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/build-tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/tools/lib/x86_64