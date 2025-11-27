{ ... }:
{
  imports =
    [ (import ./nvim.nix) ]
    ++ [ (import ./packages.server.nix) ]
    ++ [ (import ./git.nix) ];
}
