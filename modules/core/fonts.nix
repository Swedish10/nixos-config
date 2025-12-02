{ pkgs, config, ... }:
{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.hurmit
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JeyBrainsMono Nerd Font Mono" ];
      };
    };
  };
}
