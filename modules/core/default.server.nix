{ ... }:
{
  imports = 
    [ (import ./wireless.nix) ]
    ++ [ (import ./programs.nix) ]
    ++ [ (import ./user.nix) ];
}
