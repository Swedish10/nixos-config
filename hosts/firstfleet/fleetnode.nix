{ pkgs, config,  ... }:
{
  networking = {
    firewall.enable = false;
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };

  services.k3s = {
    enable = true;
    role = "agent";
    serverAddr = "https://10.0.0.10:6443";
    token = "K100a42eae3b99f8a4ae40a2ec4ad137c96d984d601429fc0bc220bcbe4c5789652::server::502c692de38dcc84fdcd666404eea7ef";
    extraFlags = toString [
      "--node-ip=10.0.0.11"
    ];
  };

  services.nfs.client.enable = true;
}
