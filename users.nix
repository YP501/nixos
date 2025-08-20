{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  users.users.yp = {
    isNormalUser = true;
    description = "YP501";
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "nixos";
  };

  home-manager = {
    useGlobalPkgs = true;
    users.yp = { pkgs, ... }: {
      home = {
        stateVersion = "25.05";
        packages = with pkgs;
          [
            # example pkgs
          ];
      };
    };
  };
}
