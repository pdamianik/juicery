{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    open-sans
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    monocraft
    miracode
    ubuntu_font_family
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
  ];
}
