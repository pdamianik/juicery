{ lib, ... }:
{
  programs.vesktop.settings = lib.importJSON ./vesktopSettings.json;
  programs.vesktop.vencord.settings = lib.mkDefault (lib.importJSON ./vencordSettings.json);
  
  programs.vesktop.theme."catppuccin-mine.theme".enable = true;
}
