{ config, pkgs, lib, ... }:

{
  # install packages
  home.packages = with pkgs; [
    waybar
    swaynotificationcenter
    playerctl
    pwvucontrol
    swayidle
    swaybg
	];

	# look at all config folders in /neovim/dotfiles and symlink them to ~/.config
	# uses mkOutOfStoreSymlink so the files can be updated without rebuilding
	home.file = builtins.listToAttrs (map( name: {
		name = ".config/${name}";
		value.source = config.lib.file.mkOutOfStoreSymlink (config.home.homeDirectory + "/nixos/modules/sway/dotfiles/${name}");

	}) (builtins.attrNames (builtins.readDir ./dotfiles)));

	# import individual modules for specific stuff
	imports = [
	  ./gtk.nix
		./thunar.nix
		./fuzzel.nix
		./swaylock.nix
	];
}
