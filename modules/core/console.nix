{ pkgs, config, ... }:
{
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    keyMap = "us";
  };
}
