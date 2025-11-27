{ pkgs, config, ... }:
{
  # Configurtation Neccessary for MacMini 5,3
  hardware.enableRedistributableFirmware = true;
  nixpkgs.config.allowUnfree = true;
  boot.kernelModules = [ "b43" ];
  boot.blacklistedKernelModules = [ "wl" ];
  networking.enableB43Firmware = true;
}
