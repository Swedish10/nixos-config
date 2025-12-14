{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    neovim
    jq
    tmux
    curl
    wget
  ];
}

