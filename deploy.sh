set -x  # echo on

SRC_DIR=~/src/varios
CONF_DIR=$SRC_DIR/conf

echo "source $SRC_DIR/vimfiles/_vimrc" >> ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
vim -c PluginUpdate

echo "source-file $CONF_DIR/_tmux.conf" >> ~/.tmux.conf

printf "[include]\n\tpath = $CONF_DIR/_gitconfig" >> ~/.gitconfig
cat $CONF_DIR/_gitignore >> ~/.gitignore

echo "--options=$CONF_DIR/_ctags" >> ~/.ctags

echo "source $CONF_DIR/_bashrc" >> ~/.bashrc

cat $CONF_DIR/_clang-format >> ~/.clang-format

cat $CONF_DIR/_haskeline >> ~/.haskeline

cat $CONF_DIR/_ghci >> ~/.ghci

cat $CONF_DIR/_inputrc >> ~/.inputrc
