{
  description = "Configurations for all my nix systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qmk_daemon = {
      url = "github:pdamianik/qmk_daemon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # aagl = {
    #   url = "github:ezKEa/aagl-gtk-on-nix/release-24.11";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... } @ inputs: let
    inherit (self) outputs;
    hosts = builtins.attrNames (builtins.readDir ./nixos/hosts);
    util = import ./util;
  in {
    nixosConfigurations = builtins.listToAttrs (map (host:
    let
      system = import ./nixos/hosts/${host}/system.nix;
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      name = host;
      value = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit host inputs outputs util system pkgs-unstable; };
        modules = [
          { networking.hostName = host; }
          ./nixos/hosts/${host}
        ];
      };
    }) hosts);
  };
}
