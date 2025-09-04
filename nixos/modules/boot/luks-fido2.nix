{
  boot.initrd = {
    systemd.enable = true;
    luks.fido2Support = true;
  };
}
