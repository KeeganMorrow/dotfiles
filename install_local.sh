# TODO: Handle installing nvim

if hash rustup 2>/dev/null; then
    echo "Rust already installed"
else
    echo "Installing Rust"
    curl https://sh.rustup.rs -sSf | sh
    source ~/.profile
fi

if hash fzf 2>/dev/null; then
    echo "FZF already installed"
else
    echo "Installing FZF"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    echo "n\n" | ~/.fzf/install
fi

if hash fd 2>/dev/null ; then
    echo "fd already installed"
else
    echo "Installing fd"
    cargo install fd
fi

if hash bat 2>/dev/null ; then
    echo "bat already installed"
else
    echo "Installing bat"
    cargo install bat
fi

if hash delta 2>/dev/null ; then
    echo "delta already installed"
else
    echo "Installing delta"
    cargo install git-delta
fi

if hash rg 2>/dev/null ; then
    echo "Ripgrep already installed"
else
    echo "Installing ripgrep"
    cargo install ripgrep
fi

if hash exa 2>/dev/null; then
    echo "exa already installed"
else
    echo "Installing exa"
    cargo install exa
fi
if hash tree-sitter 2>/dev/null; then
    echo "tree-sitter already installed"
else
    echo "Installing tree-sitter"
    cargo install tree-sitter-cli
fi
