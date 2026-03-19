{ pkgs, ... }:
{
  home.packages = with pkgs; [ xivlauncher ];
  xdg.desktopEntries = {
    xivlauncher = {
      name = "Final Fantasy XIV";
      exec = "gamemoderun XIVLauncher.Core";
      icon = "/home/juice/Downloads/ffxiv_dx11_icons_ICO/ffxiv_dx11_256x256_32bit.ico";
      terminal = false;
      categories = [ "Game" ];
      comment = "Custom launcher for FFXIV";
      type = "Application";
      settings = {
        StartupWMClass = "XIVLauncher.Core";
      };
    };
  };
}

