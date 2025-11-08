{ lib, pkgs, ... }:
{
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        $env.config.show_banner = false
        $env.config.buffer_editor = "nvim"
        $env.EDITOR = "nvim"

        # $env.config.completions.external = {
        #   enable: true
        #   max_results: 100
        #   completer: $completer
        # }

        # Nuhell aliases
        alias cnu = config nu
        alias gs = git status

        # ls Aliases
        alias lla = ls -ls
        alias la = ls -a
        alias ll = ls -l
        alias l = ls

        # Git Aliases
        alias ga = git add
        alias gr = git rm
        alias grd = git rm -r
        alias gc = git commit -a
        alias gcm = git commit -m
        alias gpm = git push origin main

        # other helper aliases
        alias n = nvim
        alias dots = cd ~/.dotfiles

        oh-my-posh init nu --config ~/.config/oh-my-posh/config.json
      '';
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;
  };
}
