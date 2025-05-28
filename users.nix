{ config, pkgs, ... }:

{
  users.users.yp = {
    isNormalUser = true;
    description = "YP501";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
