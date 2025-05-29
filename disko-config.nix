{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/<device-here>";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              name = "ESP";
              start = "1M";
              end = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot/efi";
                mountOptions = [ "umask=0077" ];
              };
            };

            root = {
              name = "NIXROOT";
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                # mountpoint = "/";
                mountOptions = [ "compress=zstd" "noatime" ];
                subvolumes = {
                  "@root" = { mountpoint = "/"; };

                  "@home" = { mountpoint = "/home"; };
                };
              };
            };
          };
        };
      };
    };
  };
}
