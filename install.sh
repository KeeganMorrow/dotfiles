#!/bin/sh
backupdir="./backup"

#######################################
# Helper functions
#######################################
cloneto () {
    uri=$1
    dest=$2
    if [ -d $dest ]; then
        echo "Directory \"${dest}\" located, not re-cloning"
    else
        mkdir -pv $dest
        git clone $uri $dest
    fi
}

install_link () {
    src=$1
    dest=$2
    if [ -f $dest ]; then
        bak_dest="${backupdir}/$(basename ${src})_$(date +"%Y%m%d_%H%M%S")"
        echo "Destination \"${dest}\" already exists, moving to \"${bak_dest}\""
        mv $dest $bak_dest
    fi 
    echo "Linking from \"${src}\" to \"${dest}\""
    ln -sr ${src} ${dest}
}

#######################################
# Install required git repositories
#######################################

cloneto git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cloneto https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#######################################
# Set up symbolic links to dotfiles.
#######################################
for file in dotfiles/*
do
    dest="${HOME}/.$(basename ${file})"
    install_link $file $dest
done

#######################################
# Install Konsole colorschemes
#######################################
install_link "./konsole/color/Monokai.colorscheme" "${HOME}/.kde4/share/apps/konsole/Monokai.colorscheme"

