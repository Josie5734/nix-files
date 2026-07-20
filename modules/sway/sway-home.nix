{ config, pkgs, lib, ... }:

{
  # install packages
  home.packages = with pkgs; [
    playerctl
    pwvucontrol
    swayidle
    swaybg
    libnotify
	];

	# import individual modules for specific stuff
	imports = [
	  ./gtk.nix
		./thunar.nix
		./fuzzel.nix
		./swaylock.nix
		./waybar/waybar.nix
		./mako.nix
	];
}
