#!/bin/bash

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bg.jpg .gitconfig .gitignore .tmux.conf .Xdefaults .xinitrc .config/i3 .config/i3status .config/fish"        # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "---"
    mv ~/$file ~/dotfiles_old/
    echo "----------> $file"
    ln -s $dir/$file ~/$file
done
