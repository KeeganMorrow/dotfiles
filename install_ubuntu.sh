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


echo "Installing Ubuntu packages"
sudo apt update
for i in $ubuntu_packages ; do
    sudo apt install -y "$i"
done

echo "Installing Python 3 packages"
for i in $python3_packages ; do
    sudo -H pip3 install "$i"
done

if hash fd 2>/dev/null ; then
    echo "fd already installed"
else
    echo "Installing fd"
    pushd buildir
    fd_version="7.4.0"
    curl -LO "https://github.com/sharkdp/fd/releases/download/v${fd_version}/fd-musl_${fd_version}_amd64.deb"
    sudo dpkg -i fd-musl_7.4.0_amd64.deb
    popd
fi

if hash rg 2>/dev/null ; then
    echo "Ripgrep already installed"
else
    echo "Installing ripgrep"
    pushd builddir
    ripgrep_version="11.0.2"
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
    git checkout v0.2.0
    cargo install cargo-deb
    cargo deb --install
    popd
fi
