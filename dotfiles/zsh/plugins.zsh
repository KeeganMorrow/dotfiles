source ${HOME}/syncsettings/repos/zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # Load oh-my-zsh
    zgen oh-my-zsh

    # Oh-My-Zsh plugins
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/sublime
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/ssh-agent
    # Other Plugins
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src

    # Themes
    zgen oh-my-zsh themes/arrow
    zgen load korrow/zsh-themes themes/keegs

    # Save all to init script
    zgen save
fi

# Enable ssh agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding on
