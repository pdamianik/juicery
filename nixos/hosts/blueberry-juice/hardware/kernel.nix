{ config, pkgs, ... }:
{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = (with config.boot.kernelPackages; [ v4l2loopback ]) ++ (with pkgs; [ perf ]);
}
