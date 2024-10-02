{ config, pkgs, ... }:

{
  imports = [ ./home.nix ];

  services.gpg-agent = let ttl_secs = 8 * 60 * 60;
  in {
    enable = true;
    defaultCacheTtl = ttl_secs;
    maxCacheTtl =  ttl_secs;
    pinentryPackage = pkgs.pinentry-qt;
  };

  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    includes = [
      "$HOME/.ssh/ssh.config.*"
    ];
  };

  # N.B. this packages are automatically merged with the ones in home.nix
  home.packages = [
    pkgs.pinentry-qt
    pkgs.ninja
    pkgs.cmake
    pkgs.nodejs_22 # so mason can install pyright lsp
    pkgs.poppler_utils # to convert pdf to png
  ];

  programs.zsh = {
    shellAliases = {
      my-ls = "ll";
    };
  };
}
