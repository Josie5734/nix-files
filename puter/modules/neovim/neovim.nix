{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
		# nvim
		neovim # also installed in system config but just incase

		# plugin dependencies
		tree-sitter
		gcc
		gnutar
		curl
		ripgrep
		fzf
		fd

		# lsps
		lua-language-server

		# formatters
		stylua
	];

	# look at all config folders in /neovim/dotfiles and symlink them to ~/.config
	# uses mkOutOfStoreSymlink so the files can be updated without rebuilding
	home.file = builtins.listToAttrs (map( name: {
		name = ".config/${name}";
		value.source = config.lib.file.mkOutOfStoreSymlink (config.home.homeDirectory + "/nixos/puter/modules/neovim/dotfiles/${name}");

	}) (builtins.attrNames (builtins.readDir ./dotfiles)));
}
