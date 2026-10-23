{ pkgs, inputs, lib, ...}:
{

 #Install hyprland
  programs.hyprland = {
    enable = true;
};
  #Install virt-manager and virtualization tools
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  users.groups.libvirtd.members = ["junkiejamba"];
  virtualisation.spiceUSBRedirection.enable = true;
  programs.kdeconnect = {
    enable = true;
};
  #Install Zsh
  programs.zsh.enable = true;
  #Install Steam
  programs.steam = {
    enable = true;
};
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     tsukimi
     jellyfin-desktop
     unrar
     mediawriter
     vim
     kdePackages.okular
     libreoffice
     onlyoffice-desktopeditors
     qbittorrent
     vlc
     proton-vpn
     btop
     git
     wget
     alacritty
     kitty
     tmux
     kora-icon-theme
     adwaita-icon-theme
     hicolor-icon-theme
     gruvbox-plus-icons
     inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
   ] ;
   fonts.packages = with pkgs; [
     nerd-fonts.caskaydia-cove
     nerd-fonts.fira-code
     nerd-fonts.symbols-only
     font-awesome
     cantarell-fonts  
     noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-color-emoji
     liberation_ttf
     fira-code
     fira-code-symbols
     mplus-outline-fonts.githubRelease
     dina-font
     proggyfonts
   ];
}

