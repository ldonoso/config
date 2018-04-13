set -x  # echo on

SRC_DIR=~/src/varios

echo "source $SRC_DIR/vimfiles/_vimrc" >> ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
vim -c PluginUpdate

echo "source-file $SRC_DIR/_tmux.conf" >> ~/.tmux.conf

printf "[include]\n\tpath = $SRC_DIR/_gitconfig" >> ~/.gitconfig
cat $SRC_DIR/_gitignore >> ~/.gitignore

echo "--options=$SRC_DIR/_ctags" >> ~/.ctags

echo "source $SRC_DIR/_bashrc" >> ~/.bashrc




