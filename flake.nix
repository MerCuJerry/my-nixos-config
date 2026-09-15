{
  description = "Mekuri-NixOS-Config";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      # replace official cache with a mirror located in China
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];

    # nix community's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-26.05&shallow=1";
    nixpkgs-unstable.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";
    trae = {
      url = "github:MerCuJerry/trae-cn-nixos/main";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, trae, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgsUnstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
    traePkgs = trae;
  in {
  nixosConfigurations = {
      mekurilap = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
            ./boot.nix
            ./hardware-configuration.nix
            ./configuration.nix
            ./network.nix
            ./system-environment.nix
            ./locale.nix
            ./users.nix
            ./display.nix
            ./proxy.nix
            ./packages.nix
        ];
        specialArgs = {
          inherit pkgsUnstable;
          inherit traePkgs;
        };
      };
    };
  };
}
