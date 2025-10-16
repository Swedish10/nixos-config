{ ... }:
{
  imports = 
    [ (import ./pipewire.nix) ]
    ++ [ (import ./network.nix) ]
    ++ [ (import ./programs.nix) ]
    ++ [ (import ./user.nix) ]
    ++ [ (import ./firefox.nix) ]
    ++ [ (import ./kdeplasma.nix) ]
    ++ [ (import ./printing.nix) ];
}
