#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

printf "\n${bold}Install updates\n${normal}" &&
sudo apt update && sudo apt upgrade -y &&

printf "\n${bold}Install software\n${normal}" &&
sudo apt install python3-pip zsh chromium-browser firefox picard &&

# Bandwhich network traffic monitor
printf "\n${bold}Install bandwhich\n${normal}" &&
sudo apt purge cargo rustc libstd-rust-1.37 libstd-rust-dev &&
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
rustup install stable &&
cargo install bandwhich &&
# set elevated permissions for bandwhich
sudo setcap cap_sys_ptrace,cap_dac_read_search,cap_net_raw,cap_net_admin+ep `which bandwhich` &&

# .zshrc
printf "\n${bold}Deleting ~/.zshrc if exists.\n" &&
rm -f ~/.zshrc &&
printf "${bold}Symlinking .zshrc: ${normal}" &&
ln -sv $HOME/dotfiles/.zshrc $HOME/.zshrc &&

printf "\nDone.\n";
