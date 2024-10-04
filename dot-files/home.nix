# apply wih `home-manager switch`

{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "ldonoso";
  home.homeDirectory = "/home/ldonoso";

  # enable settings that make Home Manager work better on GNU/Linux distributions other than NixOS.
  targets.genericLinux.enable = true;

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

    pkgs.tree
    pkgs.pandoc

    # N.B. Automatically integrated with the shell
    # To use it, create a `.envrc` file with your local config
    pkgs.direnv

    pkgs.gnumake
    pkgs.xsel  # tmux-yank on linux (windows uses the installed by default clip.exe)
    pkgs.dos2unix
 ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      html-to-md = "pandoc --standalone --eol=lf -f html-native_divs-native_spans -t gfm --wrap=none --markdown-headings=atx";
      cd-logs = "cd $(ls -td -- ~/win/src/TestingEnvironment/Logs/*/ | head -n 1)";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "vi-mode" "direnv" ];
      theme = "robbyrussell";
      extraConfig = ''
        VI_MODE_SET_CURSOR=true  # the cursor style changes when switching to a different input mode
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

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank # copy to the system clipboard in tmux
    ];

    extraConfig = ''
      set -g status-right "#H %d-%b-%y"
      set -g pane-active-border-style fg=red  # Make active pane noticeable
      set -sa terminal-overrides ",*-256col*:Tc"  # inform tmux its parent terminal supports RGB

      # resize panes
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # new windows in the current dir
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # vim keybindings for copy/paste
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind -T copy-mode-vi y send-keys -X copy-selection
    '';
  };

  programs.bat.enable = true;

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

    "nix/nix.conf" = {
      enable = false; # Whether this file should be generated. This option allows specific files to be disabled.
      text = ''
        extra-experimental-features = nix-command flakes
      '';
    };
  };

}
