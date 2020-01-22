#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

printf "${bold}Install updates\n" &&
sudo apt update && sudo apt upgrade -y &&

printf "${bold}Install software\n" &&
sudo apt install python3-pip zsh chromium-browser firefox picard &&


# .zshrc
printf "${bold}Deleting ~/.zshrc if exists.\n" &&
rm -f ~/.zshrc &&
printf "${bold}Symlinking .zshrc: ${normal}" &&
ln -sv $HOME/dotfiles/.zshrc $HOME/.zshrc &&

printf "\nDone.\n";
