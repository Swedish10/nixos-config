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

  networking.hostName = "swix-cutter01"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  networking.interfaces.enp2s0f0.ipv4.addresses = [{
    address = "10.0.0.11";
    prefixLength = 24;
  }];

  services.k3s = {
    enable = true;
    role = "agent";
    serverAddr = "https://10.0.0.10:6443";
    token = "K100a42eae3b99f8a4ae40a2ec4ad137c96d984d601429fc0bc220bcbe4c5789652::server::502c692de38dcc84fdcd666404eea7ef";
    extraFlags = toString [
      "--node-ip=10.0.0.11"
    ];
  };

  # Set your time zone.
  time.timeZone = "America/NewYork";

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

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

