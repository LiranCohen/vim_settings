#!/bin/sh
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/*
rm -rf ~/.vim/autoload/*


TMUX=$(tmux --help| grep "command not found" | wc -l)
until [ $TMUX -lt 1 ]; do
    sudo apt-get install -y tmux 
    let CMAKE-=1
done

CMAKE=$(cmake --help| grep "command not found" | wc -l)
until [ $CMAKE -lt 1 ]; do
    sudo apt-get install -y cmake
    let CMAKE-=1
done

VIM=$(vim --version | grep "command not found" | wc -l)
until [ $CMAKE -lt 1 ]; do
    sudo apt-get install -y vim
    let CMAKE-=1
done

VIM=$(vim --version | grep "7.4" | wc -l)
until [ $CMAKE -lt 1 ]; do
    sudo apt-get install -y vim 
    let CMAKE-=1
done

echo "alias vi='vim'" >> .bash_profile

cd bundle
git submodule update --init --recursive
git submodule foreach git pull origin master 
cd ..

cp -rf bundle/* ~/.vim/bundle/
cp -f ~/.vimrc ~/

(cd ~/.vim/bundle/YouCompleteMe; sh install.sh --gocode-completer;)

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


