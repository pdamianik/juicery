{ pkgs, ... }:
{
  imports = [
    ./remote-desktop.nix
  ];
  # Pre 25.11
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # As of 25.11 TODO upgrade
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;

  services.udev.packages = with pkgs; [
    gnome-settings-daemon
  ];

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/mutter" = {
          experimental-features = [
            "scale-monitor-framebuffer" # Enables fractional scaling (125% 150% 175%)
            "variable-refresh-rate" # Enables Variable Refresh Rate (VRR) on compatible displays
            "xwayland-native-scaling" # Scales Xwayland applications to look crisp on HiDPI screens
          ];
        };
      };
    }
  ];
}
