{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    # Shell
    # oh-my-posh

    # Environment shit
    wget
    gcc
    gnumake
    python3

    # CLI shit
    neofetch
    btop
    fzf
    tree
    cowsay
    fortune
    ripgrep
    cargo
    rustc
    gitui
  ];
}

