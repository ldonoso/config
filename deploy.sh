set -x  # echo on

sudo apt install make python3-pip silversearcher-ag tree universal-ctags ack-grep

# file viewer on wsl that allows you to open files and folders from wsl in windows
# so vim gx works
sudo apt install wslu

# nvim dependencies
sudo apt install ninja-build gettext cmake unzip curl

# nvim - for python 3 plugins
sudo python3 -m pip install --user --upgrade pynvim

SRC_DIR=$HOME/src/config/

# Do not overwrite .bashrc
echo "source $SRC_DIR/dotfiles/dot-bashrc" >> $HOME/.bashrc

