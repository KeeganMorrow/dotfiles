#!/bin/sh
backupdir="./backup"

#######################################
# Install required git repositories
#######################################
cloneto () {
    if [ -d $1 ]; then
        echo "Directory \"${1}\" located, not re-cloning"
    else
        mkdir -pv $1
        git clone $2 $1
    fi
}

cloneto ~/.oh-my-zsh git://github.com/robbyrussell/oh-my-zsh.git
cloneto ~/.vim/bundle/Vundle.vim https://github.com/gmarik/Vundle.vim.git

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

