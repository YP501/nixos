{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {

            ESP = {
              size = "512MiB";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot/efi";
                options = [ "umask=0077" ];
              };
            };

            swap = {
              size = "32GiB";
              type = "8200";
              content = { type = "swap"; };
            };

            root = {
              size = "100%";
              content = {
                type = "btrfs";
                mountpoint = "/";
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                    type = "subvolume";
                  };

                  "@home" = {
                    mountpoint = "/home";
                    type = "subvolume";
                  };

                  "@var" = {
                    mountpoint = "/var";
                    type = "subvolume";
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
