{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Exclude apps from KDE that I don't need
  environment.plasma6.excludePackages = with pkgs.kdePackages; [ elisa kate ];

  # Enable flatpak support
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart =
        "${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo";
    };
  };

  programs.zsh.enable = true;
}
