{
  description = "Swedish's NixOs Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:nix-community/stylix/release-25.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ... 
    }@inputs:
    let
      username = "swedish";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        schooner = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            inputs.stylix.nixosModules.stylix
            (import ./hosts/schooner)
          ];
          specialArgs = {
            host = "schooner";
            inherit self inputs username;
          };
        };
        sloop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            inputs.stylix.nixosModules.stylix
            (import ./hosts/sloop)
          ];
          specialArgs = {
            host = "sloop";
            inherit self inputs username;
          };
        };
        skiff1 = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ (import ./hosts/firstfleet/skiff1) ];
          specialArgs = {
            host = "skiff1";
            inherit self inputs username;
          };
        };
      }; 
    };
}

## Template for future hosts - Add under nixosConfigurations
#
#        hostname = nixpkgs.lib.nixosSystem {
#          inherit system;
#          modules = [ (import ./hosts/hostname) ];
#          specialArgs = {
#            host = "hostname";
#            inherit self inputs username;
#          };
#        };
