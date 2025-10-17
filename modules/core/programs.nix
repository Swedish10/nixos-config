{ pkgs, inputs, ... }:
{
  # programs = {
  #   fish.enable = true;
  # };

  environment.systemPackages = with pkgs; [
    kdePackages.kate
    git
    neovim
    jq
  ];
}

