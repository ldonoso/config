# apply wih `home-manager switch`

{ config, pkgs, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "ldonoso";
  home.homeDirectory = "/home/${config.home.username}";

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
  };

  services.lorri.enable = true;

  home.packages = with pkgs; [
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

    git
    ack

    universal-ctags  # vim.Tagbar
    unzip  # nvim.mason
    ripgrep  # nvim.telescope
    fd  # nvim.telescope

    tree
    pandoc

    # N.B. Automatically integrated with the shell
    # To use it, create a `.envrc` file with your local config
    direnv

    gnumake
    xsel  # tmux-yank on linux (windows uses the installed by default clip.exe)
    dos2unix
 ];

  programs.neovim = {
    enable = true; # home.sessionVariables = { EDITOR = "nvim"; };
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
  programs.fzf.enable = true;

  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"]; # replace cd, adds cdi
  };

  home.file = {
    ".gitconfig".source = ./dot-gitconfig;  # create a copy in the store and a symlink to the copy
    ".gitignore".source = ./dot-gitignore;
  };

  xdg.configFile = {
    "nvim/" = {
      source = ./nvim;
      # If false then the target will be a link to the source dir.
      # If true then the target will be a dir structure matching the source's
      # but whose leafs are links to the files of the source dir.
      recursive = false;
    };

    "nix/nix.conf" = {
      enable = false; # Whether this file should be generated. This option allows specific files to be disabled.
      text = ''
        extra-experimental-features = nix-command flakes
      '';
    };
  };

}
