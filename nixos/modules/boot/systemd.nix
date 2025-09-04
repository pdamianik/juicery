{
  boot.loader.timeout = 0;
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
    memtest86.enable = true;
    netbootxyz.enable = true;
    # consoleMode = "max";
  };
}
