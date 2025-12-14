{ pkgs, inputs, ...}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    globals.mapleader = " ";

    opts = {
      termgiucolors = true;

      # tab settings
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      shiftround = true;
      autoindent = true;
      smartindent = true;

      # lines
      number = true;
      relativenumber = true;
      wrap = false;
      cursorline = true;
      signcolumn = "yes";
      scrolloff = 12;
      sidescrolloff = 6;


    };
  };
}
