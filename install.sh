mkdir -p ~/.vim/autoload &&
mkdir -p ~/.vim/bundle &&
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cp -rf .vim ~/.vim
cp -f .vimrc ~/.vimrc
