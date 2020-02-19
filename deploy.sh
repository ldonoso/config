set -x  # echo on

stow -d ./dotfiles -t ~ -S tmux bash clang ctags git haskell markdown_lint tmux vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugUpdate
