{ config, pkgs, lib, inputs, hostname, ... }:

{
	home.username = "josie";
	home.homeDirectory = "/home/josie";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	# TODO:
	# deal with leftover xfce stuff
	#
	home.packages = with pkgs; [
    # other/general
    vlc
    keepassxc
    qbittorrent
    pnpm
    nodejs
    steam-run
  ];

	# import modules for each program
  # comment out to exclude them
	imports = [
    "${inputs.modules}/sway/sway-home.nix"
	  "${inputs.modules}/zsh/zsh.nix"
  	"${inputs.modules}/neovim/neovim.nix"
		"${inputs.modules}/kitty/kitty.nix"
    "${inputs.modules}/firefox/firefox.nix"
		"${inputs.modules}/pico8/pico8.nix"
		"${inputs.modules}/zeditor/zeditor.nix"
	];
}
