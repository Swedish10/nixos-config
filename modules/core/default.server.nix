{ ... }:
{
  imports = 
    [ (import ./wireless.nix) ]
    ++ [ (import ./programs.nix) ]
    ++ [ (import ./console.nix) ]
    ++ [ (import ./ssh.nix) ]
    ++ [ (import ./fonts.nix) ]
    ++ [ (import ./user.nix) ];
}
