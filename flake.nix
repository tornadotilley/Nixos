{
  description = "NixOS system flake tracking nixos-unstable";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
  };
};

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.yorinaga = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Adjust if using aarch64-linux
      specialArgs = { inherit inputs; };
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };
}
