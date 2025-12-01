{ pkgs, config, ... }:
{
  services.kmscon.enable = true;

  services.kmscon = {
    hwRender = true;
    fonts = [
      {
        name = "Source Code Pro";
        package = pkgs.source-code-pro;
      }
    ];
  };

  environment.systemPackages = [
    pkgs.terminus_font
    pkgs.unifont
    pkgs.pango
  ];
}
