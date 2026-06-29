{ config, pkgs, lib, ... }:

{
	home.username = "josie";
	home.homeDirectory = "/home/josie";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	home.shellAliases = {
		# nix
		rebuild = "cd ~/nixos/puter && git add . && sudo nixos-rebuild switch --flake ~/nixos/puter";
	};

	# enable zsh with oh-my-zsh
	programs.zsh = {
		enable = true;
		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
			plugins = [ "git" ];
		};
	};

	home.packages = with pkgs; [];

	# import modules for each program
  # comment out to exclude them
	imports = [
		./modules/neovim/neovim.nix
		./modules/kitty/kitty.nix
    ./modules/pico8/pico8.nix
	];
}
