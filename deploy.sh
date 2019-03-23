set -x  # echo on

SRC_DIR=~/src/varios
CONF_DIR=$SRC_DIR/conf

echo "source $SRC_DIR/vimfiles/_vimrc" >> ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugUpdate

printf "[include]\n\tpath = $CONF_DIR/_gitconfig" >> ~/.gitconfig
cat $CONF_DIR/_gitignore >> ~/.gitignore
echo "source-file $CONF_DIR/_tmux.conf" >> ~/.tmux.conf
echo "--options=$CONF_DIR/_ctags" >> ~/.ctags
echo "source $CONF_DIR/_bashrc" >> ~/.bashrc
cat $CONF_DIR/_clang-format >> ~/.clang-format
cat $CONF_DIR/_haskeline >> ~/.haskeline
cat $CONF_DIR/_ghci >> ~/.ghci
cat $CONF_DIR/_inputrc >> ~/.inputrc
