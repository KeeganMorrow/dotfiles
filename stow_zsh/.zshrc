source ~/.zsh/plugins.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh

machinerc="${HOME}/.zsh/local/$(hostname).zshrc"
workrc="${HOME}/.zsh/local/work.zshrc"
workpath="/usr0/igdev/"

if [ -e "$machinerc" ];then
    echo "Using zshrc for $(hostname)"
    source $machinerc
fi

if [ -d "$workpath" ]; then
    echo "Using work zshrc"
    source $workrc
fi

# Disable <C-s> and <C-q>
stty -ixon

precmd() {
    if [[ -n "$TMUX" ]]; then
        tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
    fi
    case $TERM in
        screen*)
            # Set Tmux-title to zsh and pwd
            print -Pn "\033k$(basename %~)\033\\"
            # Set urxvt title to zsh and pwd
            print -Pn "\e]2;zsh:%~\a"
    ;;
    esac
}
preexec() {
    case $TERM in
        screen*)
            # Set Tmux-title to running program
            print -Pn "\033k$(echo "$1" | cut -d' ' -f1)\a"
            print -Pn "\e]2;zsh:%~\a"
    ;;
    esac
}

# Source fzf if it is available
FZF_TMUX=0
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
