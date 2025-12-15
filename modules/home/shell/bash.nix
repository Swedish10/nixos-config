{ pkgs, ... }:
{
  programs.bash.enable = true;

  programs.bash.shellAliases = {
    ll = "ls -alF";
    gs = "git status";
    ga = "git add";
    gc = "git commit -m";
    lol = "fortune | cowsay";
    swix-rebuild = "sudo nixos-rebuild switch --flake ~/swix/#";
    swix-remote = "sudo nixos-rebuild switch --flake github:Swedish10/nixos-config#";
  };

  programs.bash.initExtra = ''
    export EDITOR="nvim"
  '';
}
