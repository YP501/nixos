{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
    "${
      builtins.fetchTarball
      "https://github.com/nix-community/disko/archive/master.tar.gz"
    }/module.nix"
    ./disko-config.nix
    ./hardware-configuration.nix
    ./bootloader.nix
    ./networking.nix
    ./locale.nix
    ./desktop.nix
    ./users.nix
    ./system-packages.nix
    ./drivers.nix
  ];

  system.stateVersion = "25.05";
}
