#!/usr/bin/env bash
# Ubuntu Packages
read -r -d '' ubuntu_packages << EOM
automake
cmake
gettext
colordiff
compton
curl
exuberant-ctags
gawk
git
global
npm
libfontconfig1-dev
libfreetype6-dev
liblua5.1-0-dev
lua5.3
m4
neovim
net-tools
nitrogen
picocom
python-pip
python2
python3
python3-pip
rofi
tmux
tree
unzip
xclip
zsh
EOM

read -r -d '' python3_packages << EOM
dploy
jedi
EOM

mkdir -p builddir

echo "Installing Ubuntu packages"
sudo apt update
for i in $ubuntu_packages ; do
    sudo apt install -y "$i"
done

echo "Installing Python 3 packages"
for i in $python3_packages ; do
    sudo -H pip3 install "$i"
done

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
    pushd buildir
    fd_version="8.3.2"
    curl -LO "https://github.com/sharkdp/fd/releases/download/v${fd_version}/fd_${fd_version}_amd64.deb"
    sudo dpkg -i fd_${fd_version}_amd64.deb
    popd
fi

if hash bat 2>/dev/null ; then
    echo "bat already installed"
else
    echo "Installing bat"
    pushd builddir
    bat_version="0.20.0"
    curl -LO "https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_${bat_version}_amd64.deb"
    sudo dpkg -i bat_${bat_version}_amd64.deb
    popd
fi

if hash delta 2>/dev/null ; then
    echo "delta already installed"
else
    echo "Installing delta"
    pushd builddir
    delta_version="0.12.1"
    curl -LO "https://github.com/dandavison/delta/releases/download/${delta_version}/git-delta_${delta_version}_amd64.deb"
    sudo dpkg -i delta_${delta_version}_amd64.deb
    popd
fi

if hash rg 2>/dev/null ; then
    echo "Ripgrep already installed"
else
    echo "Installing ripgrep"
    pushd builddir
    ripgrep_version="13.0.0"
    curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/${ripgrep_version}/ripgrep_${ripgrep_version}_amd64.deb"
    sudo dpkg -i "ripgrep_${ripgrep_version}_amd64.deb"
    popd
fi

if hash rustup 2>/dev/null; then
    echo "Rust already installed"
else
    echo "Installing Rust"
    curl https://sh.rustup.rs -sSf | sh
    source ~/.profile
fi

if hash alacritty 2>dev/null; then
    echo "Alacritty already installed"
else
    echo "Installing Alacritty"
    pushd builddir
    git clone https://github.com/jwilm/alacritty.git
    cd alacritty
    git checkout v0.10.1
    cargo install cargo-deb
    cargo deb --install
    popd
fi

if hash exa 2>dev/null; then
    echo "exa already installed"
else
    echo "Installing exa"
    pushd builddir
    git clone https://github.com/ogham/exa.git
    cd exa
    git checkout v0.10.1
    cargo install cargo-deb
    cargo deb --install
    popd
fi
