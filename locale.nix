{ config, pkgs, ... }:

{
  time.timeZone = "Europe/Amsterdam";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_CTYPE = "en_US.UTF-8";
      LC_NUMERIC = "C.UTF-8";
      LC_TIME = "C.UTF-8";
      LC_COLLATE = "en_US.UTF-8";
      LC_MONETARY = "C.UTF-8";
      LC_MESSAGES = "en_US.UTF-8";
      LC_PAPER = "C.UTF-8";
      LC_NAME = "C.UTF-8";
      LC_ADDRESS = "C.UTF-8";
      LC_TELEPHONE = "C.UTF-8";
      LC_MEASUREMENT = "C.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
    };
  };
}
