{ config, pkgs, ... }:

{
  # NVIDIA + graphics
  # hardware.graphics.enable = true;
  # services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   open = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  #   powerManagement = {
  #     enable = false;
  #     finegrained = false;
  #   };
  # };

  # Audio (PipeWire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
