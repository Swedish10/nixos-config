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

  networking.hostName = "swix-cutter02"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  networking.interfaces.enp2s0f0.ipv4.addresses = [{
    address = "10.0.0.12";
    prefixLength = 24;
  }];

  services.k3s = {
    enable = true;
    role = "agent";
    serverAddr = "https://10.0.0.10:6443";
    token = "K10556a39d95c73e81d406fc764380227da3a67a9976584da02d588990478dd437a::server:e6747e4a3a232809012c19b5b2bd55ef";
    extraFlags = toString [
      "--node-ip=10.0.0.12"
    ];
  };

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

