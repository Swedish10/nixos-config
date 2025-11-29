{ ... }:
{
  imports = 
    [ (import ./wireless.nix) ]
    ++ [ (import ./programs.nix) ]
    ++ [ (import ./console.nix) ]
    ++ [ (import ./user.nix) ];
}
