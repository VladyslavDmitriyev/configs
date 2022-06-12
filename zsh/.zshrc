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

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# Plugins init
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
