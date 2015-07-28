#!/bin/sh
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/*
rm -rf ~/.vim/autoload/*

apt-get update

if ! cmake_loc="$(tpye -p "cmake")" || [ -z "$cmake_loc" ]; then
    # install cmake
    apt-get install -y cmake
fi

if ! tmux_loc="$(type -p "tmux")" || [ -z "$tmux_loc" ]; then
      # install tmux
      apt-get install -y tmux
fi

if ! vim_loc="$(type -p "vim")" || [ -z "$tmux_loc" ]; then
      # install tmux
      apt-get install -y vim 
fi

VIM=$(vim --version | grep "7.4" | wc -l)
if [ $VIM -lt 1]; then
    #upgrae vim
    apt-get install -y vim
fi

echo "alias vi='vim'" >> .bash_profile

cd bundle
git submodule update --init --recursive
git submodule foreach git pull origin master 
cd ..

cp -rf bundle/* ~/.vim/bundle/
cp -f ~/.vimrc ~/

(cd ~/.vim/bundle/YouCompleteMe; sh install.sh --gocode-completer;)

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


