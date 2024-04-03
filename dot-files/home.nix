{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "ldonoso";
  home.homeDirectory = "/home/ldonoso";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11";

  services.lorri.enable = true;

  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    pkgs.git
    pkgs.silver-searcher
    pkgs.neovim
    pkgs.tree
    pkgs.pandoc
    pkgs.direnv
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      html-to-md = "pandoc --standalone --eol=lf -f html-native_divs-native_spans -t gfm --wrap=none --markdown-headings=atx";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    profileExtra = ''
      if [ -e ${config.home.homeDirectory}/.nix-profile/etc/profile.d/nix.sh ]; then . ${config.home.homeDirectory}/.nix-profile/etc/profile.d/nix.sh; fi
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "vi-mode" "direnv" ];
      theme = "robbyrussell";
      extraConfig = ''
        VI_MODE_SET_CURSOR=true  # the cursor style is changed when switching to a different input mode
      '';
    };
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "a";
    keyMode = "vi";
    mouse = true;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];

    extraConfig = ''
      set -g status-right "#H %d-%b-%y"
      set -g pane-active-border-style fg=red  # Make active pane noticeable
      set -g mouse on

      set -sa terminal-overrides ",xterm*:Tc"  # inform tmux our underline terminal supports RGB

      # Resize panes
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # vim keybindings for copy/paste
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection
    '';
  };

  home.file = {
    # Building this configuration will create a copy of file in the Nix store.
    # Activating the configuration will then make '~/.gitconfig' a symlink to the Nix store copy.
    # todoluis - use variables
    ".gitconfig".source = /home/ldonoso/src/config/dot-files/dot-gitconfig;
    ".gitignore".source = /home/ldonoso/src/config/dot-files/dot-gitignore;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  xdg.configFile."nvim" = {
    source = /home/ldonoso/src/config/dot-files/nvim;
    recursive = true;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.bat.enable = true;
}
