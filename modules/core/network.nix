{ pkgs, lib, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };
  };
}
