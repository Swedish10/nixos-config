{ ... }:
{
  imports =
    [ (import ./nvim.nix) ]
    ++ [ (import ./packages.server.nix) ]
    ++ [ (import ./shell/bash.nix) ]
    ++ [ (import ./git.nix) ];
}
