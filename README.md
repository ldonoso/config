# Installation

## Windows terminal

- Set nerd font (Noto Mono)
- Delete keybinding C-v so it does not interfere with nvim keybinding

## Nix

- Install the [Nix package manager](https://nixos.org/download.html#nix-quick-install)

- Clone this repo:

     nix-shell -p git --command "git clone git@github.com:ldonoso/config.git"

- Install [Home Manager](https://github.com/nix-community/home-manager#installation)

- Edit `home.nix`, change at least `home.homeDirectory` to match yours and link to the correct configuration:

    ln -s $HOME/src/config/dot-files/home.nix $HOME/.config/home-manager/home.nix

- Apply home-manager configuration:

    home-manager switch
