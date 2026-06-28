# nix-files

A repository for my NixOS configuration 

### Information

- OS: NixOS
- Shell: ZSH + OhMyZSH
- Terminal: Kitty
- Desktop: KDE
- Browser: Firefox
- Editor: Nvim

### Usage

For my personal use, this repository is located at ~/nixos

Certain programs such as Nvim and Kitty have individual modules, which are enabled within home-manager
These modules contain all required dependencies and dotfiles for those programs

#### Commands

- Use ```sudo nix-rebuild switch --flake ~/nixos``` to switch (assuming you put the repo in ~/nixos)
- Once using the config, ```Rebuild``` is available, which cd's to ~/nixos, adds everything to git repo and runs the rebuild command


#### To use for yourself:

- Download repo and place in ~/nixos
- In ```configuration.nix```:
    - Change ```users.users``` to your user
    - Change any system-wide services/pkgs such as Steam and Mullvad
    - Change filesystem stuff for your own drives/partitions
- In ```home.nix```:
    - Change username, homeDirectory
    - Choose which modules to import (Pico8 requires owning [Pico-8](https://www.lexaloffle.com/pico-8.php))
    - Any modules with dotfiles will rename existing dotfiles to ```dotfile.backup``` and replace with dotfiles from the repo
