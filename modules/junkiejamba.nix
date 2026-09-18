{ pkgs, ...}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."junkiejamba" = {
    isNormalUser = true;
    description = "junkiejamba";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      thunderbird
      git
      discord
    ];
  };

  security.sudo.extraRules = [
  {
    users = [ "junkiejamba" ];
    commands = [
      {
        command = "ALL";
        options = [ "NOPASSWD" ];
      }
    ];
  }
];
}
