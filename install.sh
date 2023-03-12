#!/bin/bash

set -e

cd "$(dirname "$0")"
sudo printf "running with sudo\n\n\n\n"
rm -rf target || rmdir targer || echo "NO TARGET FOLDER (everything is ok :)."
cargo build --release --no-default-features --features=wayland

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

sudo cp -f target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp -f extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

if which fish; then
    cp -f extra/completions/alacritty.fish /home/$USER/.config/fish/completions/alacritty.fish
fi
