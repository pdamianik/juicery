{
#   fileSystems."/" =
#     { device = "/dev/disk/by-uuid/d3744844-7251-45f2-adfa-ae923d216582";
#       fsType = "btrfs";
#       options = [ "compress=zstd" "subvol=root" ];
#     };

#   fileSystems."/boot" =
#     { device = "/dev/disk/by-uuid/F983-319B";
#       fsType = "vfat";
#       options = [ "fmask=0077" "dmask=0077" ];
#     };

#   fileSystems."/nix" =
#     { device = "/dev/disk/by-uuid/d3744844-7251-45f2-adfa-ae923d216582";
#       fsType = "btrfs";
#       options = [ "compress=zstd" "noatime" "subvol=nix" ];
#     };

#   fileSystems."/home" =
#     { device = "/dev/disk/by-uuid/d3744844-7251-45f2-adfa-ae923d216582";
#       fsType = "btrfs";
#       options = [ "subvol=home" ];
#     };

#   fileSystems."/mnt/Windows" = {
#     device = "/dev/disk/by-uuid/EC9EA1029EA0C684";
#     fsType = "ntfs-3g";
#     options = [ "defaults" "rw" "utf8" "noauto" "x-gvfs-show" "x-gvfs-name=Windows" ];
#   };

#   swapDevices =
#     [ { device = "/dev/disk/by-uuid/01b3f6a0-f6fc-4820-8b72-7004330437b2"; }
#     ];
# }

# {
#   disko.devices = {
#     disk = {
#       main = {
#         type = "disk";
#         device = "/dev/nvme1n1"; # CHANGE TO INSTALL DISK!!!
#         content = {
#           type = "gpt";
#           partitions = {
#             ESP = {
#               priority = 1;
#               name = "ESP";
#               size = "1G";
#               type = "EF00";
#               content = {
#                 type = "filesystem";
#                 format = "vfat";
#                 mountpoint = "/boot";
#                 mountOptions = [ "umask=0077" ];
#               };
#             };
#             root = {
#               end = "-32G";
#               name = "nixos";
#               content = {
#                 type = "btrfs";
#                 extraArgs = [ "-f" ]; # Override existing partition
#                 # Subvolumes must set a mountpoint in order to be mounted,
#                 # unless their parent is mounted
#                 subvolumes = {
#                   # Subvolume name is different from mountpoint
#                   "/root" = {
#                     mountpoint = "/";
#                   };
#                   # Subvolume name is the same as the mountpoint
#                   "/home" = {
#                     mountOptions = [ "compress=zstd" ];
#                     mountpoint = "/home";
#                   };
#                   # Parent is not mounted so the mountpoint must be set
#                   "/nix" = {
#                     mountOptions = [
#                       "compress=zstd"
#                       "noatime"
#                     ];
#                     mountpoint = "/nix";
#                   };
#                 };

#                 # mountpoint = "/";
#               };
#             };
#             swap = {
#               name = "swap";
#               size = "100%";
#               content = {
#                 type = "swap";
#                 discardPolicy = "both";
#                 resumeDevice = true;
#               };
#             };
#           };
#         };
#       };
#     };
#   };
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

