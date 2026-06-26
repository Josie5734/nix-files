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
      # nvim
			nvim-old = "NVIM_APPNAME=nvim-old nvim";
      
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
    # for files/folders starting with "nvim", make a regular symlink so they can be updated
    if lib.hasPrefix "nvim" name
   		  then config.lib.file.mkOutOfStoreSymlink (config.home.homeDirectory + "/nixos/puter/dotfiles/${name}")
    		  else ./dotfiles + "/${name}";
	}) (builtins.attrNames (builtins.readDir ./dotfiles)));

	home.packages = with pkgs; [
    # nvim dependencies #

    # searches (mini.pick)
		ripgrep
		fzf

    # treesitter (c compiler for the things)
    tree-sitter
    gcc
    gnutar
    curl

    # lsps
    lua-language-server

    # formatters
    stylua

    # nvim dependencies #
	];
}
