{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [ geogebra6 ];
}
