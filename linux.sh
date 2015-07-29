#!/bin/sh
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle

rm -rf ~/.vim/bundle/*
rm -rf ~/.vim/autoload/*

apt-get update

if ! cmake_loc="$(type -p "cmake")" || [ -z "$cmake_loc" ]; then
    # install cmake and build tools
    apt-get install -y build-essential cmake
fi

if ! py_loc="$(type -p "python")" || [ -z "$py_loc" ]; then
    #install python-dev
    apt-get install -y python-dev
fi

if ! curl_loc="$(type -p "curl")" || [ -z "$curl_loc"]; then
    #install curl
    apt-get install -y curl
fi

if ! tmux_loc="$(type "tmux")" || [ -z "$tmux_loc" ]; then
      # install tmux
      apt-get install -y tmux
fi

if ! vim_loc="$(type -p "vim")" || [ -z "$vim_loc" ]; then
      # install tmux
      apt-get install -y vim 
fi

VIM=$(vim --version | grep "7.4" | wc -l)
if [ $VIM -lt 1 ]; then
    #upgrae vim
    apt-get install -y vim
fi

echo "alias vi='vim'" >> .bash_profile

if ! go_loc="$(type -p "go")" || [ -z "$go_loc" ]; then
      # install tmux
      apt-get install -y go 
fi

cd bundle
git submodule update --init --recursive
git submodule foreach git pull origin master 
cd ..

cp -rf bundle/* ~/.vim/bundle/
cp -f .vimrc ~/

(cd ~/.vim/bundle/YouCompleteMe;YCM_CORES=1 ./install.sh --gocode-completer;)

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

