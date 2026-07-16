
{ config, pkgs, lib, hostname, ... }:

{
	# enable zsh with oh-my-zsh
	programs.zsh = {
		enable = true;
		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
			plugins = [ "git" ];
		};
    # enable direnv
    initContent = ''
      eval "$(direnv hook zsh)"
    '';
	};

	# shell aliases
	home.shellAliases = {
		# nix
		rebuild = "cd ~/nixos && git add . && sudo nixos-rebuild switch --flake ~/nixos/${hostname}";

		# zeditor
		zed = "zeditor";
	};

}
