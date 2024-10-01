{ config, pkgs, ... }:

{
  imports = [ ./home.nix ];

  services.gpg-agent = {
    enable = true;
    # it must ve GUI tool in order to for with vim-fugitive https://github.com/tpope/vim-fugitive/issues/846#issuecomment-521816260
    defaultCacheTtl = 8 * 60 * 60; # secs
    maxCacheTtl =  8 * 60 * 60; # secs
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.zsh = {
    shellAliases = {
      my-ls = "ll";
    };
  };

  # N.B. this packages are automatically merged with the ones in home.nix
  home.packages = [
    pkgs.ninja
    pkgs.cmake
    pkgs.nodejs_22 # so mason can insall pyright lsp
  ];
}
