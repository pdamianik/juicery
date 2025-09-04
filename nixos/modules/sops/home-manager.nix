{ inputs, ... }:
{
  home-manager.sharedModules = [
    inputs.sops.homeManagerModules.sops
  ];
}

