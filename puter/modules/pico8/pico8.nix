{ config, pkgs, lib, ... }:
let # define location of pico8 binary. change if in a different location
  pico8Bin = "${config.home.homeDirectory}/.local/share/pico-8/pico8";
in
{
  home.packages = with pkgs; [
    steam-run # install steam-run to be able to run the precompiled binary
    wget # required for bbs search
  ];

  # aliases to run using steam-run
  home.shellAliases = {
    pico = "steam-run ${pico8Bin}";
    pico8 = "steam-run ${pico8Bin}";
    pico-8 = "steam-run ${pico8Bin}";
  };

  # make a desktop entry for pico-8.
  xdg.desktopEntries.pico8 = {
    name = "Pico-8";
    exec = "steam-run ${pico8Bin}";
    categories = [ "Game" ];
  };

	# look at all config folders in /${module_name}/dotfiles and symlink them to ~/.lexaloffle
	home.file = builtins.listToAttrs (map( name: {
		name = ".lexaloffle/${name}";
		value.source = ./dotfiles + "/${name}";

	}) (builtins.attrNames (builtins.readDir ./dotfiles)));
}
