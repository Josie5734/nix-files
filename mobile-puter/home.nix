{ config, pkgs, lib, inputs, hostname, ... }:

{
	home.username = "josie";
	home.homeDirectory = "/home/josie";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
    # other/general
    vlc
    keepassxc
    steam-run
  ];

	# import modules for each program
  # comment out to exclude them
	imports = [
	  # use swaywm
  	"${inputs.modules}/sway/sway-home.nix"

	  "${inputs.modules}/zsh/zsh.nix"
		"${inputs.modules}/kitty/kitty.nix"
  	"${inputs.modules}/neovim/neovim.nix"
    "${inputs.modules}/zeditor/zeditor.nix"
    "${inputs.modules}/firefox/firefox.nix"
		"${inputs.modules}/pico8/pico8.nix"
		"${inputs.modules}/keepassxc/keepassxc.nix"
	];
}
