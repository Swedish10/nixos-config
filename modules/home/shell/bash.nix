{ pkgs, ... }:
{
  programs.bash.enable = true;

  programs.bash.shellAliases = {
    ll = "ls -alF";
    gs = "git status";
    ga = "git add";
    gc = "git commit -m";
    lol = "fortune | cowsay";
  };

  programs.bash.initExtra = ''
    export EDITOR="nvim"
  '';
}
