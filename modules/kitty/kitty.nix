{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        kitty
    ];

	# look at all config folders in /${module_name}/dotfiles and symlink them to ~/.config
	home.file = builtins.listToAttrs (map( name: {
		name = ".config/${name}";
		value.source = ./dotfiles + "/${name}";

	}) (builtins.attrNames (builtins.readDir ./dotfiles)));
}
