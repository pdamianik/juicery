{
  imports = [
    ../boot
    ../boot/systemd.nix
    ../networking/networkmanager.nix
    ../networking/tailscale.nix
    ../networking/cloudflare-warp.nix
    ../apps/yubikey.nix
    ../system/time.nix
    # ../apps/podman.nix
  ];
}

