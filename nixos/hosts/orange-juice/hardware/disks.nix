{
  # fileSystems."/" =
  #   { device = "/dev/disk/by-uuid/0e9f9a13-2f97-4bcc-b2ec-887e5503581f";
  #     fsType = "btrfs";
  #     options = [ "subvol=root" "compress=zstd" "noatime" ];
  #   };

  # fileSystems."/home" =
  #   { device = "/dev/disk/by-uuid/0e9f9a13-2f97-4bcc-b2ec-887e5503581f";
  #     fsType = "btrfs";
  #     options = [ "subvol=home" "compress=zstd" ];
  #   };

  # fileSystems."/nix" =
  #   { device = "/dev/disk/by-uuid/0e9f9a13-2f97-4bcc-b2ec-887e5503581f";
  #     fsType = "btrfs";
  #     options = [ "subvol=nix" "compress=zstd" "noatime" ];
  #   };

  # fileSystems."/boot" =
  #   { device = "/dev/disk/by-uuid/C1F2-F15B";
  #     fsType = "vfat";
  #     options = [ "fmask=0022" "dmask=0022" ];
  #   };

  # swapDevices =
  #   [ { device = "/dev/disk/by-uuid/20ebc588-16c8-4e54-b6a2-30958d2ade5d"; }
  #   ];

  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme1n1"; # CHANGE TO INSTALL DISK!!!
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            encrypted = {
              size = "100%";
              name = "nixos";
              content = {
                type = "luks";
                name = "root";
                settings = {
                  allowDiscards = true;
                  crypttabExtraOpts = [
                    "fido2-device=auto"
                    "token-timeout=10"
                  ];
                };
                content = {
                  type = "lvm_pv";
                  vg = "pool";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      pool = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ]; # Override existing partition
              # Subvolumes must set a mountpoint in order to be mounted,
              # unless their parent is mounted
              subvolumes = {
                # Subvolume name is different from mountpoint
                "/root" = {
                  mountpoint = "/";
                };
                # Subvolume name is the same as the mountpoint
                "/home" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/home";
                };
                # Parent is not mounted so the mountpoint must be set
                "/nix" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                  mountpoint = "/nix";
                };
              };

              # mountpoint = "/";
            };
          };
          swap = {
            name = "swap";
            size = "32G";
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true;
            };
          };
        };
      };
    };
  };
}
