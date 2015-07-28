#!/bin/sh
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/*
rm -rf ~/.vim/autoload/*

cp -rf vim/* ~/.vim/
cp -f .vimrc ~/

(cd ~/.vim/bundle; git submodule update --init; git submodule foreach git pull origin master)
(cd ~/.vim/bundle/YouCompleteMe; sh install.sh --gocode-completer;)

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


