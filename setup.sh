#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

printf "${bold}Symlinking .zshrc: ${normal}" &&
ln -sv .zshrc ~ &&
printf "\nDone."
