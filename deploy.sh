set -x  # echo on

#SRC_DIR=$HOME/src/config/
SRC_DIR=/C/Users/luis/src/varios

stow --dir=$SRC_DIR/dotfiles --target=$HOME --dotfiles --stow clang ctags git haskell markdown_lint mysql tmux vim nvim bash

# Do not overwrite .bashrc
echo "source $SRC_DIR/dotfiles/dot-bashrc" >> $HOME/.bashrc

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugUpdate
