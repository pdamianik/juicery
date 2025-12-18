{
  imports = [
    ../boot
    ../boot/systemd.nix
    ../boot/lanzaboote.nix
    ../networking/cloudflare-warp.nix
    ../networking/networkmanager.nix
    ../networking/openssh.nix
    ../networking/tailscale.nix
    ../apps/yubikey.nix
    ../system/time.nix
    ../apps/podman.nix
    ../system/nixld.nix
  ];
}

