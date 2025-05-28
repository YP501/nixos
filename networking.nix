{ config, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
    firewall.enable = true;
  };
}
