{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ../../../modules/core/default.server.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "swix-skiff1"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "America/NewYork";
 
  #
  #   Do NOT change this value unless you have manually inspected 
  # all the changes it would make to your configuration, and
  # migrated your data accordingly.
  # For more information, see:
  #  `man configuration.nix`
  #            or
  #   https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  #
  system.stateVersion = "25.05"; # Did you read the comment?
}

