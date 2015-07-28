#!/bin/sh
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/*
rm -rf ~/.vim/autoload/*

cd bundle
git submodule update --init --recursive
git submodule foreach git pull origin master 

cp -rf bundle/* ~/.vim/bundle
cp -f ~/.vimrc ~/

(cd ~/.vim/bundle/YouCompleteMe; sh install.sh --gocode-completer;)

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


