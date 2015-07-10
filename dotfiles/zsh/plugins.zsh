source ${HOME}/syncsettings/repos/antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle gitfast
antigen bundle pip
antigen bundle sublime
antigen bundle command-not-found
antigen bundle ssh-agent

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme korrow/zsh-themes themes/keegs

# Tell antigen that you're done.
antigen apply

# Enable ssh agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding on
