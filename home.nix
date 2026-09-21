{ pkgs, inputs, ... }:

{
  home.username = "junkiejamba";
  home.homeDirectory = "/home/junkiejamba";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch
    pfetch
    eza
    ttyper
    obsidian
    foliate
    discord
  ];
  programs.vim = {
    enable = true;

    # Declarative Vim settings mapping to your dotfile
    settings = {
      number = true;         # set number
      expandtab = true;      # set expandtab
      tabstop = 2;           # set tabstop=2
      shiftwidth = 2;        # set shiftwidth=2
    };
     extraConfig = ''
       set autoindent
       set smartindent
       set hlsearch
       set incsearch
     '';
  };
# Starship prompt (replaces `eval "$(starship init zsh)"`)
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  # Declarative Zsh Configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    # Oh My Zsh configuration
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "";
    };
    # Session environment variables
    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
      LIBVIRT_DEFAULT_URI = "qemu:///system";
      VAGRANT_DEFAULT_PROVIDER = "libvirt";
    };
    # Shell aliases
    shellAliases = {
    #  # eza replacements
    #  ls = "eza --icons=auto";
    #  l = "eza -1 --icons=auto";
    #  ll = "eza -l --icons=auto --git";
    #  la = "eza -a --icons=auto";
    #  lla = "eza -la --icons=auto --git";
    #  lt = "eza --tree --level=2 --icons=auto";
    #  lS = "eza -l --sort=size --icons=auto";
    #  lt-mod = "eza -l --sort=modified --icons=auto";

      # Virtualization
      virsh = "virsh -c qemu:///system";

      # Quick NixOS rebuild helper
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#yorinaga";
    };

    # Commands to execute at the end of interactive shell startup
    initContent = ''
      fastfetch
    '';
  };
  #Declarative bash configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#yorinaga";
    };
  };

  programs.home-manager.enable = true;

}
