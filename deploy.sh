set -x  # echo on

stow --dir=$HOME/src/config/dotfiles --target=$HOME --dotfiles --stow bash clang ctags git haskell markdown_lint tmux vim mysql

# Do not overwrite .bashrc
echo "source $HOME/src/config/dotfiles/dot-bashrc" >> $HOME/.bashrc

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugUpdate
