{
  description = "Minimal Nixos iso built for MacMini 5,3";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  outputs = { self, nixpkgs }: {
    nixosConfiguration = {
	  macmini = nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
		modules = [
		  ({ pkgs, modulesPath, ... }: {
		    imports = [
			  (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
			  (modulesPath + "/installer/cd-dvd/channel.nix")
			];
			hardware.enableRedistributableFirmware = true;
			nixpkgs.config.allowUnfree = true;
			boot.kernelModules = [ "b43" ];
			boot.blacklistedModules = [ "wl" ];
			networking.enableB43Firmware = true;
			enviroment.systemPackages = [
			  pkgs.neovim
			  pkgs.git
			];
			nix.settings.experimental-features = [ "nix-command" "flakes" ];
			isoImage.squashfsCompression = "gzip -Xcompression-level 1"
		  })
		];
	  };
	};
  };
}
