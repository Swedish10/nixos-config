{ ... }:
{
  imports =
    [ (import ./nvim.nix) ]
    ++[ (import ./packages.nix) ]
    ++ [ (import ./git.nix) ];
}
