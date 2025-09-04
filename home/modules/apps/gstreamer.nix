{ pkgs, ... }:
{
  home.packages = with pkgs.gst_all_1; [
    gstreamer
    gst-vaapi
  ];
}
