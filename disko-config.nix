{
  disko.devices = {
    NIXOS = {
      type = "disk";
      device = "/dev/<device-here>";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            name = "ESP";
            size = "512MiB";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot/efi";
              mountOptions = [ "umask=0077" ];
            };
          };

          swap = {
            name = "swap";
            size = "32768MiB"; # 32 GiB
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true;
              priority = 99;
            };
          };

          root = {
            name = "root";
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
}
