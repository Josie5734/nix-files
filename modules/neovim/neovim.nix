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
		lua-language-server # lua
    vscode-extensions.pollywoggames.pico8-ls # pico-8
    pyright # python

		# formatters
		stylua # lua
    ruff # python
	];

	# look at all config folders in /neovim/dotfiles and symlink them to ~/.config
	# uses mkOutOfStoreSymlink so the files can be updated without rebuilding
	home.file = builtins.listToAttrs (map( name: {
		name = ".config/${name}";
		value.source = config.lib.file.mkOutOfStoreSymlink (config.home.homeDirectory + "/nixos/modules/neovim/dotfiles/${name}");

	}) (builtins.attrNames (builtins.readDir ./dotfiles)));
}
