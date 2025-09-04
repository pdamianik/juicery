{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lunarvim # TODO depcrecated
  ];
}
