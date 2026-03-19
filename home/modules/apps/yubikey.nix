{ pkgs, ... }:
{
  home.packages = with pkgs; [ yubioath-flutter age-plugin-yubikey age rage sops ];
}
