# Installation

- Install the [Nix package manager](https://nixos.org/download.html#nix-quick-install)

- Clone this repo to `~/src/config/`:

         nix-shell -p git --command "git clone git@github.com:ldonoso/config.git $HOME/src/config"

- Install [Home Manager](https://github.com/nix-community/home-manager#installation)

- Edit `home.nix`, change at least `home.homeDirectory` to match yours and link to the correct configuration:

        ln -s $HOME/src/config/dot-files/home.nix $HOME/.config/home-manager/home.nix
