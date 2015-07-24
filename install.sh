mkdir -p ~/.vim/autoload &&
mkdir -p ~/.vim/bundle &&
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cp -rf .vim/bundle/* ~/.vim/bundle/
cp -rf .vim/autoload/* ~/.vim/autoload/
cp -f .vimrc ~/.vimrc
