mkdir -p ~/.vim/autoload &&
mkdir -p ~/.vim/bundle &&
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &&

cp -rf vim/* ~/.vim/ &&
cp -f .vimrc ~/.vim/.vimrc &&
(cd ~/.vim/bundle; git submodule update --init;) &&
(cd ~/.vim/bundle/YouCompleteMe; ./install.sh --gocode-completer;) &&
ln -sf ~/.vim/.vimrc /.vimrc



