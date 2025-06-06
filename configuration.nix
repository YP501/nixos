{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
    ./disko-config.nix
    ./bootloader.nix
    ./networking.nix
    ./locale.nix
    ./desktop.nix
    ./users.nix
    ./applications.nix
    ./drivers.nix
  ];

  system.stateVersion = "25.05";
}
