{ pkgs, ... }:
{
  home.packages = with pkgs; [ pkgsRocm.blender ];
}
