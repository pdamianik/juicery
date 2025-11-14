{ pkgs-unstable, ... }:
{
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    package = pkgs-unstable.zed-editor;
  };
}
