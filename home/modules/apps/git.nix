{ username, ... }:
{
  imports = [
    ../../users/${username}/modules/apps/git.nix
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}
