{ pkgs, ... }:
let extensions = with pkgs.gnomeExtensions; [
  appindicator
  bluetooth-battery-meter
  blur-my-shell
  # brightness-control-using-ddcutil
  control-monitor-brightness-and-volume-with-ddcutil
  cloudflare-warp-toggle
  gnome-40-ui-improvements
  # gsnap
  hibernate-status-button
  just-perfection
  # quick-settings-audio-panel
  # reboottouefi
  restart-to
  # syncthing-toggle
  tailscale-qs
  tiling-shell
  user-avatar-in-quick-settings
  wallpaper-slideshow
];
in
{
  home.packages = extensions ++ (with pkgs; [
    ddcutil
  ]);

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) extensions;
    "org/gnome/shell".disabled-extensions = [];
  };
}
