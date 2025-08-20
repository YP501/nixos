{ config, pkgs, ... }:

let
  catppuccin-grub = pkgs.fetchGit {
    url = "https://github.com/catppuccin/grub.git";
    rev = "2a5c8be8185dae49dd22030df45860df8c796312"; # Dec 22 2024 commit
  };
in {
  boot.loader = {
    systemd-boot.enable = false;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      theme = "${catppuccin-grub}/src/catppuccin-mocha-grub-theme";
    };
  };
}
