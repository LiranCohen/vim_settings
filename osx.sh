#!/bin/sh
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/*
rm -rf ~/.vim/autoload/*

CMAKE=$(cmake --help| grep "command not found" | wc -l)
until [ $CMAKE -lt 1 ]; do
    brew install cmake
    let CMAKE-=1
done

cd bundle
git submodule update --init --recursive
git submodule foreach git pull origin master 
cd ..

cp -rf bundle/* ~/.vim/bundle/
cp -f ~/.vimrc ~/

(cd ~/.vim/bundle/YouCompleteMe; sh install.sh --gocode-completer;)

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


