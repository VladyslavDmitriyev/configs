#!/bin/zsh

# make link for env config and load it
ln -s ~/configs/zsh/.zshenv ~/.zshenv;
source ~/.zshenv;

# backup existing configs
date_dir=`date +"%d-%m-%Y-%H-%M-%S"`
date_dir_path="$HOME/config-backups/$date_dir"
mkdir -p $date_dir_path;
cp -a $HOME/.config/. $date_dir_path;

# make dirs
if [[ ! -d "$TMUXDOTDIR" ]]
then
    mkdir -p $TMUXDOTDIR;
fi

if [[ ! -d "$ZDOTDIR" ]]
then
    mkdir -p $ZDOTDIR;
fi

# make links
ln -s ~/configs/tmux/tmux.conf $TMUXDOTDIR/tmux.conf;
ln -s ~/configs/zsh/.zshrc $ZDOTDIR/.zshrc;
ln -s ~/configs/zsh/aliases.zsh $ZDOTDIR/aliases.zsh;
ln -s ~/configs/zsh/completion.zsh $ZDOTDIR/completion.zsh;
ln -s ~/configs/zsh/prompt_setup $ZDOTDIR/prompt_setup;

# install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/
mkdir $ZDOTDIR/plugins  
mv zsh-syntax-highlighting $ZDOTDIR/plugins/zsh-syntax-highlighting

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
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