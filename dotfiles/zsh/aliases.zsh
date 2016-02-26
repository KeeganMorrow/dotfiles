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

alias clip='xclip -selection clipboard'

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

alias less='less -N -R'

# Use vi style keys for info
alias info='info --vi-keys'

# Always fork zathura into background
alias zathura='zathura --fork'
