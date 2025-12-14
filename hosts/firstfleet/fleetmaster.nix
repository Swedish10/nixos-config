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
      "--node-ip=10.0.0.10"
      "--advertise-address=10.0.0.10"
      "--bind-address=10.0.0.10"
      "--write-kubeconfig-mode=644"
      "disable=servicelb"
      "--disable=traefik"
    ];
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /data/k8s 10.0.0.0/24(rw,sync,no_subtree_check,no_root_squash)
    '';
  };

  services.rpcbind.enable = true;

  environment.systemPackages = with pkgs; [
    nfs-utils
  ];
}
