{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
		# nvim
		zed-editor-fhs
	];

	# look at all config folders in /zeditor/dotfiles and symlink them to ~/.config
	# uses mkOutOfStoreSymlink so the files can be updated without rebuilding
	home.file = builtins.listToAttrs (map( name: {
		name = ".config/${name}";
		value.source = config.lib.file.mkOutOfStoreSymlink (config.home.homeDirectory + "/nixos/modules/zeditor/dotfiles/${name}");

	}) (builtins.attrNames (builtins.readDir ./dotfiles)));
}
