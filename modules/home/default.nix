{ ... }:
{
  imports =
    [ (import ./nvim.nix) ]
    ++[ (import ./packages.nix) ]
    ++[ (import ./shell/oh-my-posh.nix) ]
    ++[ (import ./shell/nushell.nix) ]
    ++ [ (import ./git.nix) ];
}
