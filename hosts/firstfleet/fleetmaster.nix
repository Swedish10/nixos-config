{ pkgs, config, ... }:
{
  networking = {
    firewall.enable = false;

    defaultGateway = "192.168.1.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };

  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = [
      "--write-kubeconfig-mode=644"
      "disable=servicelb"
      "--disable=traefik"
    ];
  };
}
