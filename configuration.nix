{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    ./bootloader.nix
    ./networking.nix
    ./locale.nix
    ./desktop.nix
    ./users.nix
    ./programs.nix
  ];

  system.stateVersion = "25.05";
}
