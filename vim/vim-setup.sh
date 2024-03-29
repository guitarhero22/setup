#!/bin/bash

# Only tested for ubuntu as of now

distro=${1:-"ubuntu"}

echo "installing necessary packages for $distro..."

if [[ "$distro" -eq "ubuntu" ]]; then
sudo apt install -y git wget \
    build-essential \
    make cmake \
    python3 python3-dev \
    libncurses-dev 

sudo apt install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev #silver searcher

elif [[ "$distro" -eq "fedora" ]]; then
sudo dnf install git wget \
    gcc gcc-c++ \
    make cmake \
    ncurses \
    ncurses-devel \
    python3 python3-devel \
    libX11-devel gtk3-devel

#silver searcher
sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install pcre-devel xz-devel zlib-devel
fi

pushd .

mkdir -p $HOME/sources
cd $HOME/sources
echo "cloning vim..."
git clone --single-branch --depth 1 https://github.com/vim/vim.git

echo "changing directory..."
cd vim

echo 
echo
echo
echo "Configuring vim..."
./configure --with-features=huge \
    --enable-multibyte \
    --enable-python3interp \
    --enable-gui=auto

echo 
echo
echo 
echo "Compiling vim, grab a cold one..."
make

echo 
echo
echo
echo "Installing..."
sudo make install

echo
echo
echo
echo "Installing FZF..."
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

echo
echo
echo "Installing silver searcher"
git clone --depth 1 https://github.com/ggreer/the_silver_searcher.git
pushd .
cd the_silver_searcher
./build.sh
sudo make install
popd


echo 
echo
echo
echo "Making Tree for packages"
mkdir -p "$HOME/.vim/pack/" "$HOME/.vim/pack/coding/start" "$HOME/.vim/pack/colors/opt"

echo "Adding packages for coding..."
cd "$HOME/.vim/pack/coding/start"

plugins_to_install=( \
"junegunn/fzf.vim" \
"preservim/nerdtree" \
"MarcWeber/vim-addon-mw-utils" \
"vim-airline/vim-airline" \
"garbas/vim-snipmate" \
"ycm-core/YouCompleteMe" \
"Xuyuanp/nerdtree-git-plugin" \
"tpope/vim-fugitive" \
"airblade/vim-gitgutter" \
)

for plug in ${plugins_to_install[@]}
do
git clone --single-branch --depth 1 "http://github.com/$plug.git"
done

echo "Compiling YouComplete Me"
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --clangd-completer

popd

echo "Copying vimrc"
cp .vimrc "$HOME/"
