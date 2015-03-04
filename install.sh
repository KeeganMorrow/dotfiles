#!/bin/sh
backupdir="./backup"

#######################################
# Install oh-my-zsh
######################################
omz_dir="$HOME/.oh-my-zsh"
omz_uri="git://github.com/robbyrussell/oh-my-zsh.git"

if [ -d $omz_dir ]; then
    echo "oh-my-zsh directory located, not re-cloning"
else
    git clone $omz_uri $omz_dir
fi
#######################################
# Set up symbolic links to dotfiles.
#######################################
for file in dotfiles/*
do
    dest="${HOME}/.$(basename ${file})"
    if [ -f $dest ]; then
        bak_dest="${backupdir}/$(basename ${file})_$(date +"%Y%m%d_%H%M%S")"
        echo "File \"${dest}\" already exists, moving to \"${bak_dest}\""
        mv $dest $bak_dest
    fi
    echo "Linking from \"${file}\" to \"${dest}\""
    ln -sr ${file} ${dest}
done

