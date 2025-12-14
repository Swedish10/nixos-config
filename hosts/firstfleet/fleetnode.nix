{ pkgs, config, ... }:
{
  networking = {
    firewall.enable = false;

    defaultGateway = "192.168.1.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };
}
