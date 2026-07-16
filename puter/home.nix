{ config, pkgs, lib, inputs, hostname, ... }:

{
	home.username = "josie";
	home.homeDirectory = "/home/josie";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
    homebank # finances
	];

	# import modules for each program
  # comment out to exclude them
	imports = [
  	"${inputs.modules}/zsh/zsh.nix"
		"${inputs.modules}/neovim/neovim.nix"
		"${inputs.modules}/kitty/kitty.nix"
    "${inputs.modules}/firefox/firefox.nix"
		"${inputs.modules}/pico8/pico8.nix"
    "${inputs.modules}/love/love.nix"
		"${inputs.modules}/zeditor/zeditor.nix"
	];
}
