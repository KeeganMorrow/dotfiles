# Always use colordiff
alias diff=colordiff

# If ag isn't available then set up an alias for ack
if ! hash ag 2>/dev/null; then
    alias ag='ack'
fi

# Aliases for virtualenvwrapper
# Taken from http://mrcoles.com/tips-using-pip-virtualenv-virtualenvwrapper/
alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

if ! hash getclip 2> /dev/null; then
    alias getclip='xclip -selection clipboard -o'
    alias putclip='xclip -selection clipboard'
fi

# Aliases to get weather information from wttr.in
alias weath='curl -s "wttr.in/Everett,Wa"'
alias moon='curl -s "wttr.in/Moon"'

# Make minicom always have wrapping enabled
alias minicom='minicom -w'

# Used to make ssh sessions start in the pwd
alias ssh='sshwrapper'

open(){
    xdg-open "$@" &
}

sshwrapper(){
    \ssh "$@" -t "type $(basename $SHELL) &> /dev/null" &> /dev/null
    if [[ $? -eq 0 ]]; then
        echo "Found matching shell $SHELL"
        ssh_shell="$SHELL"
    else
        echo "Using fallback shell sh"
        ssh_shell="sh"
    fi
    \ssh "$@" -t "cd $(realpath .) ; $ssh_shell -l"
}

sshcons(){
    \ssh zardoz -t "zsh -c \"scons -C $(realpath .) $@\""
}

# Alias for git - see .gitconfig for subcommand aliases
alias g='git'

# Make this a git subcommand?
groot(){
    local gitroot=$(git rev-parse --show-cdup)
    if [ -d "$gitroot" ]; then
        cd "$gitroot"
    fi
}

iv(){
    vimiv "$@" &
}
alias vimiv='iv'

alias vimwiki='vim -c VimwikiIndex'

alias less='less -N -R'

# Use vi style keys for info
alias info='info --vi-keys'

# Always fork zathura into background
alias zathura='zathura --fork'

# Mount home machine via sshfs
# Requires key added to authorized_keys
alias mntkeegpi='sshfs keegan@keegpi.hopto.org:/pi/usr1 /${HOSTNAME}/keegpi'
alias ummntkeegpi='fusermount -u /${HOSTNAME}/keegpi'
