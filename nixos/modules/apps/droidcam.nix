{ pkgs, ... }:
{
  # boot.extraModulePackages = with config.boot.kernelPackages; [
  #   v4l2loopback
  # ];
  # boot.kernelModules = [ "v4l2loopback" ];
  # boot.extraModprobeConfig = ''
  #   options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  # '';
  security.polkit.enable = true;

  programs.adb.enable = true;
  programs.droidcam.enable = true;

  environment.systemPackages = with pkgs; [
    v4l-utils
  ];
}
