{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
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
    # python3
    # python3Packages.pip
    # (writeShellScriptBin "install-pip-packages" '' # This script does not run, yet.
    #   pip install --user --break-system-packages <package>
    # '')
  ];
}

