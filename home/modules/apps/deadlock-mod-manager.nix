{ pkgs-unstable, ... }: {
  home.packages = with pkgs-unstable; [ deadlock-mod-manager ];
}
