{ lib, modulesPath, system, inputs, ... }:
let
  inherit (inputs) hardware;
in
{
  imports = [
    hardware.nixosModules.common-cpu-amd
    hardware.nixosModules.common-cpu-amd-pstate
    # hardware.nixosModules.common-cpu-amd-zenpower
    hardware.nixosModules.common-gpu-amd
    hardware.nixosModules.common-pc-ssd
    ./kernel.nix
    ./disks.nix
    ./networking.nix
    ./gpu.nix
    (modulesPath + "/installer/scan/not-detected.nix")
    ../../../modules/recipies/uefi.nix
    ../../../modules/recipies/amdgpu.nix
    ../../../modules/recipies/qmk.nix
    ../../../modules/boot/luks-fido2.nix
    ../../../modules/apps/openrgb.nix
    ../../../modules/apps/solaar.nix
    ../../../modules/networking/bluetooth.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault system;
}
