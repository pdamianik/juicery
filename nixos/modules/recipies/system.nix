{
  imports = [
    ../boot
    ../boot/systemd.nix
    ../boot/lanzaboote.nix
    ../networking/networkmanager.nix
    ../networking/tailscale.nix
    ../networking/cloudflare-warp.nix
    ../apps/yubikey.nix
    ../system/time.nix
    ../apps/podman.nix
    ../system/nixld.nix
  ];
}

