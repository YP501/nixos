{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {

            esp = {
              size = "512MiB";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot/efi";
                options = [ "umask=0077" ];
                label = "ESP";
              };
            };

            swap = {
              size = "32GiB";
              type = "8200";
              content = {
                type = "swap";
                label = "SWAP";
              };
            };

            root = {
              size = "100%";
              content = {
                type = "btrfs";
                mountpoint = "/";
                label = "NIXOS"; # Label for the BTRFS volume
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                    type = "subvolume";
                    label = "root";
                  };

                  "@home" = {
                    mountpoint = "/home";
                    type = "subvolume";
                    label = "home";
                  };

                  "@var" = {
                    mountpoint = "/var";
                    type = "subvolume";
                    label = "var";
                  };
                };
                options = [ "compress=zstd" "discard=async" ];
              };
            };
          };
        };
      };
    };
  };
}
