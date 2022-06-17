# PATH
export PATH=$PATH:~/bin
# WORK
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/build-tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/tools/lib/x86_64

case "$OSTYPE" in
    solaris*) OS="SOLARIS" ;;
    darwin*)  OS="OSX" ;; 
    linux*)   OS="LINUX" ;;
    bsd*)     OS="BSD" ;;
    msys*)    OS="WINDOWS" ;;
    cygwin*)  OS="ALSO WINDOWS" ;;
    *)        OS="unknown: $OSTYPE" ;;
esac

if [[ $OS = "LINUX" ]]
then
    export EDITOR=`where micro | head -1`
    export VISUAL=`where micro | head -1`

    export JAVA_HOME=/usr/lib/jvm/default
    export ANDROID_HOME=~/AndroidSDK
    export ANDROID_SDK_ROOT=~/AndroidSDK
    echo $OS "variables exported"
elif [[ $OS = "OSX" ]]
then
    export EDITOR=`where code | head -1`
    export VISUAL=`where code | head -1`

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

# Load secrets
if [ -f $ZDOTDIR/.secrets ]; then
    source $ZDOTDIR/.secrets
else
    print "404: $ZDOTDIR/.secrets not found."
fi

source $ZDOTDIR/aliases.zsh

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh

fpath=($ZDOTDIR $fpath)
autoload -Uz prompt_setup ; prompt_setup 

# Add shift-tab to the completion list
bindkey -M menuselect '^[[Z' reverse-menu-complete

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# Plugins init
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
