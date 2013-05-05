#!/bin/bash
DOTFILES=~/dotfiles
rsync -a --exclude=install.sh --exclude=oh-my-zsh.tar.gz $DOTFILES/.* ~/
pacman -S zsh git
aura -A vim-solarized-git dircolors-solarized-git otf-droidsansmono-powerline-git

#clean up and upadte oh-my-zsh
mkdir -p ~/.oh-my-zsh
cd ~/.oh-my-zsh
rm -rf ~/.oh-my-zsh/*
tar zxf $DOTFILES/oh-my-zsh.tar.gz
git reset --hard origin/master
git pull
chsh -s /bin/zsh
