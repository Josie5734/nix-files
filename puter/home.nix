{ config, pkgs, lib, ... }:

{
	home.username = "josie";
	home.homeDirectory = "/home/josie";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	# enable zsh with oh-my-zsh
	programs.zsh = {
		enable = true;
		shellAliases = {
      # neovim
			minivim = "NVIM_APPNAME=nvim-minivim nvim";
			mvim = "NVIM_APPNAME=nvim-minivim nvim";
      # nix
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos";
		};
		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
			plugins = [ "git" ];
		};
	};


	# go through everything in dotfiles and put into .config
	home.file = builtins.listToAttrs (map( name: {
		name = ".config/${name}";
		value.source =
      if lib.hasPrefix "nvim" name
      then config.lib.file.mkOutOfStoreSymlink (config.home.homeDirectory + "/nixos/puter/dotfiles/${name}")
      else ./dotfiles + "/${name}";
	}) (builtins.attrNames (builtins.readDir ./dotfiles)));

	home.packages = with pkgs; [
		ripgrep
		fzf
	];
}
