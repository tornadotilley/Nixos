{ pkgs, inputs, ...}:

{
# Install hyprland
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
     vim
     fastfetch
     btop
     wget
     alacritty
     kitty
     tmux
     inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
   ];
}
