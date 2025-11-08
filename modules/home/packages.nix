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
    nushell
    oh-my-posh

    # Environment shit
    wezterm
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
    # python3
    # python3Packages.pip
    # (writeShellScriptBin "install-pip-packages" '' # This script does not run, yet.
    #   pip install --user --break-system-packages <package>
    # '')
  ];
}

