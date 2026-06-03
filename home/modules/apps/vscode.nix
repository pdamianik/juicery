{ pkgs-unstable, ... }:
{
  programs.vscode.enable = true;
  programs.vscode.package = pkgs-unstable.vscode;
}
