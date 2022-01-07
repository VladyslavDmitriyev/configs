#!/bin/zsh

date_dir=`date +"%d-%m-%Y-%H-%M-%S"`
mkdir -p ~/config-backups/$date_dir;

mv ~/.zshrc ~/config-backups/$date_dir/.zshrc;
ln -s ~/configs/.zshrc ~/.zshrc;

mv ~/.tmux.conf ~/config-backups/$date_dir/.tmux.conf;
ln -s ~/configs/.tmux.conf ~/.tmux.conf;

mv ~/.oh-my-zsh/custom/aliases.zsh ~/config-backups/$date_dir/aliases.zsh;
ln -s ~/configs/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh;

mv ~/.vimrc ~/config-backups/$date_dir/.vimrc;
ln -s ~/configs/.vimrc ~/.vimrc;