{ config, pkgs, lib, inputs, hostname, ... }:

{
	home.username = "josie";
	home.homeDirectory = "/home/josie";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	home.shellAliases = {
		# nix
		rebuild = "cd ~/nixos && git add . && sudo nixos-rebuild switch --flake ~/nixos/${hostname}";
	};

	# enable zsh with oh-my-zsh
	programs.zsh = {
		enable = true;
		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
			plugins = [ "git" ];
		};
	};

	home.packages = with pkgs; [
    # xfce/thunar extras
    xfce4-clipman-plugin
    xarchiver
    thunar-archive-plugin

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
		"${inputs.modules}/neovim/neovim.nix"
		"${inputs.modules}/kitty/kitty.nix"
    "${inputs.modules}/firefox/firefox.nix"
		"${inputs.modules}/pico8/pico8.nix"
	];
}
