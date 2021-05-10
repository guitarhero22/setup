cd ~/Downloads
git clone https://github.com/alacritty/alacritty.git
cd alacritty

#install rust
sudo apt install curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
pt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev
$HOME/.cargo/bin/cargo build --release

#INSTALLED
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
infocmp alacritty

#Desktop Entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

#Manual Entry
sudo apt install gzip
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

#Auto Completions
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

#Make alacritty default
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 50
sudo update-alternatives --config x-terminal-emulator

