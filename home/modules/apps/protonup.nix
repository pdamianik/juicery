{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [ protonup-rs protonup-qt protonplus ];
}

