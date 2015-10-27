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

# Alias for git - see .gitconfig for subcommand aliases
alias g='git'
