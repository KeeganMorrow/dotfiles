source ${HOME}/syncsettings/repos/zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Oh-My-Zsh plugins
zplug "plugins/gitfast",                from:oh-my-zsh
zplug "plugins/pip",                    from:oh-my-zsh
zplug "plugins/taskwarrior",            from:oh-my-zsh

# Prezto plugins
zplug "modules/ssh",                    from:prezto
zplug "modules/python",                 from:prezto

# Other Plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

# Themes
zplug "korrow/zsh-themes", as:theme


# Install plugins if there are plugins that have not been installed                                                                              j
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
# Enable ssh agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding on
