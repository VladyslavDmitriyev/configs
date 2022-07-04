#!/bin/zsh

# make link for env config and load it
ln -s $HOME/configs/zsh/.zshenv $HOME/.zshenv;
source $HOME/.zshenv;

# backup existing configs
date_dir=`date +"%d-%m-%Y-%H-%M-%S"`
date_dir_path="$HOME/config-backups/$date_dir"
mkdir -p $date_dir_path;
cp -a $HOME/.config/. $date_dir_path;

# make dirs
if [[ ! -d "$TMUXDOTDIR" ]]
then
    mkdir -p $TMUXDOTDIR;
else
    cp -a $TMUXDOTDIR $date_dir_path;
    cd $TMUXDOTDIR;
    ls $HOME/configs/tmux | xargs rm -r;
    cd $HOME;
fi

if [[ ! -d "$ZDOTDIR" ]]
then
    mkdir -p $ZDOTDIR;
else
    cp -a $ZDOTDIR $date_dir_path;
    cd $ZDOTDIR;
    ls $HOME/configs/zsh | xargs rm -r;
    cd $HOME;
fi


if [[ ! -d "$HOME/bin" ]]
then
    mkdir -p $HOME/bin;
else
    cp -a $HOME/bin $date_dir_path;
    cd $HOME/bin;
    ls $HOME/configs/bin | xargs rm -r;
    cd $HOME;
fi


# make links
cp -s $HOME/configs/bin/* $HOME/bin;
cp -s $HOME/configs/zsh/* $ZDOTDIR;
cp -s $HOME/configs/zsh/.zshrc $ZDOTDIR;
cp -s $HOME/configs/tmux/* $TMUXDOTDIR;

# install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  $HOME/zsh-syntax-highlighting
mkdir $ZDOTDIR/plugins  
mv $HOME/zsh-syntax-highlighting $ZDOTDIR/plugins/zsh-syntax-highlighting

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
tmux source $TMUXDOTDIR/tmux.conf

# create secrets config
ls $ZDOTDIR/.secrets
if [[ "$?" == 0 ]]
then
    echo "Secrets file exists"
else
    echo "Creating secrets file"
    touch $ZDOTDIR/.secrets
fi

source ~/.zshenv && source $ZDOTDIR/.zshrc