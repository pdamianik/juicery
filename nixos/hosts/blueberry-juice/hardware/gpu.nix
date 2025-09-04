{ pkgs, ... }:
{
  hardware.graphics = {
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      # amdvlk
      # zluda
    ];
    # extraPackages32 = with pkgs; [
    #   driversi686Linux.amdvlk
    # ];
  };
}
