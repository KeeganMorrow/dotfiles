source ${HOME}/syncsettings/repos/zplug/zplug

# Oh-My-Zsh plugins
zplug "plugins/gitfast",                from:oh-my-zsh
zplug "plugins/pip",                    from:oh-my-zsh
zplug "plugins/sublime",                from:oh-my-zsh
zplug "plugins/command-not-found",      from:oh-my-zsh
zplug "plugins/ssh-agent",              from:oh-my-zsh
# Other Plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "willghatch/zsh-cdr"
# Should be loaded after zsh-cdr
zplug "zsh-users/zaw"

# Themes
zplug "korrow/zsh-themes", of:"themes/keegs.zsh-theme"


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
# Enable ssh agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding on
