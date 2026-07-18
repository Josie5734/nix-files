{ config, pkgs, lib, inputs, hostname, ... }:

{
	home.username = "josie";
	home.homeDirectory = "/home/josie";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
    # xfce/thunar extras
    xfce4-clipman-plugin
    xarchiver
    thunar-archive-plugin
    xfce.thunar

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
    "${inputs.modules}/sway/sway.nix"
	  "${inputs.modules}/zsh/zsh.nix"
  	"${inputs.modules}/neovim/neovim.nix"
		"${inputs.modules}/kitty/kitty.nix"
    "${inputs.modules}/firefox/firefox.nix"
		"${inputs.modules}/pico8/pico8.nix"
		"${inputs.modules}/zeditor/zeditor.nix"
	];
}
