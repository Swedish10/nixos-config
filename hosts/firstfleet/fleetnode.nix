{ pkgs, config, ... }:
{
  networking = {
    firewall.enable = false;

    defaultGateway = "192.168.1.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };

  services.k3s = {
    enable = true;
    role = "agent";
    serverAddr = "https://192.168.1.10:6443";
    token = "K100a42eae3b99f8a4ae40a2ec4ad137c96d984d601429fc0bc220bcbe4c5789652::server::502c692de38dcc84fdcd666404eea7ef";
  };
}
