{ pkgs, config, ... }:
{
  services.kmscon.enable = true;

  services.kmscon = {
    hwRender = true;
    fonts = [
      {
        name = "JetBrainsMono Nerd Font Mono";
        package = pkgs.nerd-fonts.jetbrains-mono;
      }
    ];
  };

  environment.systemPackages = [
    pkgs.terminus_font
    pkgs.unifont
    pkgs.pango
  ];
}
