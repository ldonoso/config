{ config, pkgs, ... }: {
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
  home.packages = with pkgs; [
    pinentry-qt
    ninja
    cmake
    nodejs_22 # so mason can install pyright lsp
    poppler_utils # to convert pdf to png
    jq
    gh
    wslu
  ];

  programs.zsh = {
    shellAliases = {
    };

    envExtra = ''
      # Works as an alias but with parameters
      function mym () {
        make DIR_PROJECT='./' -f $HOME/src/facephi/Makefile $@
      }
    '';
  };
}
