# apply wih `home-manager switch`

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

  home.sessionVariables = {
    EDITOR = "nvim";
  };

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
    pkgs.ack

    pkgs.universal-ctags  # vim.Tagbar
    pkgs.clang  # nvim.treesitter
    pkgs.unzip  # nvim.mason
    pkgs.ripgrep  # nvim.telescope
    pkgs.fd  # nvim.telescope
    pkgs.neovim

    pkgs.tree
    pkgs.pandoc
    pkgs.direnv
    pkgs.gnumake
    pkgs.xsel  # tmux-yank
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      html-to-md = "pandoc --standalone --eol=lf -f html-native_divs-native_spans -t gfm --wrap=none --markdown-headings=atx";
      cd-logs = "cd $(ls -td -- ~/win/src/TestingEnvironment/Logs/*/ | head -n 1)";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

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
    terminal = "tmux-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "a";
    keyMode = "vi";
    mouse = false;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];

    extraConfig = ''
      set -g status-right "#H %d-%b-%y"
      set -g pane-active-border-style fg=red  # Make active pane noticeable
      set -sa terminal-overrides ",*-256col*:Tc"  # inform tmux its parent terminal supports RGB

      # Resize panes
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # New windows in the current dir
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

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
  };

  xdg.configFile = {
    "nvim" = {
      source = /home/ldonoso/src/config/dot-files/nvim;
      recursive = true;
    };

    "nix/nix.conf".text = ''
      extra-experimental-features = nix-command flakes
    '';
  };

  programs.bat.enable = true;
}
