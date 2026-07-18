{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
    waybar
    fuzzel
    swaynotificationcenter
    playerctl
    pwvucontrol
    swaylock-effects
    swayidle
    swaybg
	];

	# look at all config folders in /neovim/dotfiles and symlink them to ~/.config
	# uses mkOutOfStoreSymlink so the files can be updated without rebuilding
	home.file = builtins.listToAttrs (map( name: {
		name = ".config/${name}";
		value.source = config.lib.file.mkOutOfStoreSymlink (config.home.homeDirectory + "/nixos/modules/sway/dotfiles/${name}");

	}) (builtins.attrNames (builtins.readDir ./dotfiles)));
}
