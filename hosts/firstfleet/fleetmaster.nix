{ pkgs, config, ... }:
{
  networking = {
    firewall.enable = false;

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
