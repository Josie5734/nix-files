{
	#description
	description = "NixOS config for main PC";

	# input packages: nixpkgs stable and unstable, home-manager
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {nixpkgs, home-manager, ...} @ inputs: {
		nixosConfigurations.puter = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./puter/configuration.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.extraSpecialArgs = { inherit inputs; };
						home-manager.users.josie = ./puter/home.nix;
            home-manager.backupFileExtension = "backup";
					}
				];
		};
	};
}

