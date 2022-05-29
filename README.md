# Configs
Repository to store config files

## Backup existing files and create symlinks from the repo
Creates `~/config-backups` dir and stores all files  
```bash
./backup_and_make_links.sh
```

## Zsh Config Files
Zsh read these files in the following order:  
`.zshenv` - Should only contain user’s environment variables.
`.zprofile` - Can be used to execute commands just after logging in.
`.zshrc` - Should be used for the shell configuration and for executing commands.
`.zlogin` - Same purpose than `.zprofile`, but read just after `.zshrc`.
`.zlogout` - Can be used to execute commands when a shell exit.


```bash
source ~/.zshenv && source $ZDOTDIR/.zshrc
```