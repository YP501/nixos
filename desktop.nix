{ config, pkgs, ... }:

{
  # Plasma 6 on Wayland
  services.xserver.enable = false;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
