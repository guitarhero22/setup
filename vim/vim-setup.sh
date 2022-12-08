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
elif [[ "$distro" -eq "fedora" ]]; then
sudo dnf install git wget \
    gcc gcc-c++ \
    make cmake \
    ncurses \
    ncurses-devel \
    python3 python3-devel
fi

pushd .

cd $HOME
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
    --enable-python3interp 

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
echo
echo "Making Tree for packages"
mkdir -p "$HOME/.vim/pack/" "$HOME/.vim/pack/coding/start" "$HOME/.vim/pack/colors/opt"

echo "Adding packages for coding..."
cd "$HOME/.vim/pack/coding/start"
git clone --single-branch --depth 1 https://github.com/kien/ctrlp.vim.git
git clone --single-branch --depth 1 https://github.com/junegunn/fzf.vim.git
git clone --single-branch --depth 1 https://github.com/preservim/nerdtree
git clone --single-branch --depth 1 https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone --single-branch --depth 1 https://github.com/vim-airline/vim-airline.git
git clone --single-branch --depth 1 https://github.com/garbas/vim-snipmate.git
git clone --single-branch --depth 1 https://github.com/ycm-core/YouCompleteMe.git

echo "Compiling YouComplete Me"
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --clangd-completer

popd

echo "Copying vimrc"
cp .vimrc "$HOME/"
