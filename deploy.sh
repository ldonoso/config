set -x  # echo on

sudo apt install stow make python3-pip silversearcher-ag tree universal-ctags ack-grep

# file viewer on wsl that allows you to open files and folders from wsl in windows
# so vim gx works
sudo apt install wslu

# nvim dependencies
sudo apt-get install stow ninja-build gettext cmake unzip curl silversearcher-ag

# nvim - for python 3 plugins
sudo python3 -m pip install --user --upgrade pynvim

SRC_DIR=$HOME/src/config/

stow --dir=$SRC_DIR/dotfiles --target=$HOME --dotfiles --stow clang ctags git haskell markdown_lint mysql tmux vim nvim bash

# Do not overwrite .bashrc
echo "source $SRC_DIR/dotfiles/dot-bashrc" >> $HOME/.bashrc

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugUpdate
