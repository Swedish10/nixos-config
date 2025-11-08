{ lib, pkgs, ... }:
let
  configContent = builtins.readFile ./themes/swix.omp.json;
  defaultConfig = builtins.fromJSON configContent;
in 
{
  
  programs = {
    oh-my-posh = {
      enable = true;
      enableNushellIntegration = true;
      settings = defaultConfig;
    };
  };
}
