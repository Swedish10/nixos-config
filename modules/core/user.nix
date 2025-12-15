{ pkgs, inputs, config, username, host, stylix, ... }:
{
  imports =
    [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports =
        if (host == "SwixSchooner") then
          [ ./../home/default.nix ]
        else if (host == "galleon") then
         [ ./../home/default.server.nix ]
        else if (host == "cutter01") then
          [ ./../home/default.server.nix ]
        else if (host == "cutter02") then
          [ ./../home/default.server.nix ]
       # else if (host == "option5") then
       #   [ ./../home/default.server.nix ]
       # else if (host == "option6") then
       #   [ ./../home/default.server.nix ]
       # else if (host == "option7") then
       # [ ./../home/default.nix ]
        else
          [ ./../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
      };
      programs.home-manager.enable = true;
    };
  };

  fonts.fontconfig.antialias = false;

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      #"docker"
      #"input"
      #"dialout"
    ];
    shell = pkgs.bash;
  };
  nix.settings.allowed-users = [ "${username}" ];
}

