#!/bin/sh
backupdir="./backup"
repos="./repos"
#######################################
# Helper functions
#######################################
install_link () {
    src=$1
    dest=$2
    if [ -f $dest ]; then
        bak_dest="${backupdir}/$(basename ${src})_$(date +"%Y%m%d_%H%M%S")"
        echo "Destination \"${dest}\" already exists, moving to \"${bak_dest}\""
        mv $dest $bak_dest
    fi 
    echo "Linking from \"${src}\" to \"${dest}\""
    dirpath=$(dirname "$dest")
    if [ ! -f $dirpath ]; then
        echo "Creating directory structure needed for ${dest}"
        mkdir -p $dirpath
    fi
    ln -sr $src $dest
}

#######################################
# Install required git repositories
#######################################

git submodule init
git submodule update

echo "Linking Vundle"
install_link 'repos/Vundle.vim' "${HOME}/.vim/bundle/Vundle.vim"
echo "Linking TMux Plugin Manager"
install_link 'repos/tpm' '${HOME}/.tmux/plugins/tpm'

echo "Installing powerline fonts"
./$repos/powerline-fonts/install.sh
#######################################
# Set up symbolic links to dotfiles.
#######################################
for file in dotfiles/*
do
    dest="${HOME}/.$(basename ${file})"
    install_link $file $dest
    local="${dest}.local"
    echo "Creating empty local file \"${local}\""
    touch $local
done


#######################################
# Install Konsole colorschemes
#######################################
install_link "./konsole/color/Monokai.colorscheme" "${HOME}/.kde4/share/apps/konsole/Monokai.colorscheme"

