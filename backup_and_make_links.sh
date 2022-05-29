#!/bin/zsh

date_dir=`date +"%d-%m-%Y-%H-%M-%S"`
date_dir_path="$HOME/config-backups/$date_dir"
mkdir -p $date_dir_path;
mkdir -p $TMUXDOTDIR;

cp -a $HOME/.zshenv $date_dir_path;
cp -a $HOME/.config/. $date_dir_path;

ln -s ~/configs/zsh/.zshenv ~/.zshenv;
ln -s ~/configs/vim/.vimrc ~/.vimrc;
ln -s ~/configs/tmux/tmux.conf $TMUXDOTDIR/tmux.conf;
ln -s ~/configs/zsh/.zshrc $ZDOTDIR/.zshrc;
ln -s ~/configs/zsh/aliases.zsh $ZDOTDIR/aliases.zsh;
ln -s ~/configs/zsh/completion.zsh $ZDOTDIR/completion.zsh;
ln -s ~/configs/zsh/prompt_setup $ZDOTDIR/prompt_setup;