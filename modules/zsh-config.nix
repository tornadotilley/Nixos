{ config, pkgs, ... }:

{
  # Built-in, zero-boilerplate Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      # Bind Alt+Backspace to delete one word/path segment like Bash
      bindkey '^[^?' backward-kill-word
      bindkey '^[[3;5~' backward-kill-word

      # Make word boundaries stop at non-alphanumeric characters (slashes, dots, etc.)
      autoload -Uz select-word-style
      select-word-style bash
    '';
  };

  # Built-in Starship
  programs.starship.enable = true;

  environment.systemPackages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    ];

  # Set default user shell
  users.users.junkiejamba = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
