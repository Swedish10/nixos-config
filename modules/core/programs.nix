{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    neovim
    jq
  ];
}

