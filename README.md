# nix-files

A repository for my NixOS configuration 

### Information

- OS: NixOS
- Shell: ZSH + OhMyZSH
- Terminal: Kitty
- Desktop: KDE
- Browser: Firefox
- Editor: Nvim

### Info

Repository contents are placed in a folder: ```~/nixos/``` which contains ```modules/``` and a folder for each device (puter and mobile-puter in this repo)
    recommended to use the devices host-name as the folder name 

```modules/``` contains nix modules for individual programs, which can be individually imported into home.nix in each device folder

#### Commands

- Use ```sudo nix-rebuild switch --flake ~/nixos/{device}``` to build using this config
- Once using the config, ```Rebuild``` is available, which cd's to ~/nixos, adds everything to git repo and runs the rebuild command for the current device


#### To use for yourself:

- Download repo and place in ~/nixos
- create your own ```nixos/{device}``` folder and copy over contents from ```puter/``` or ```mobile-puter```
    - copy over your own ```hardware-configuration.nix``` from `/etc/nixos/``` if you have it
    - same with ```configuration.nix``` if you prefer to edit from what you have
- In ```flake.nix```:
    - change variable "hostname" to your computers hostname. this is then applied to all other places where hostname is used within the config
- In ```configuration.nix```:
    - Change ```users.users``` to your user
    - Set things like timezones and locales
    - Change any system-wide services/pkgs such as Steam and Mullvad
        - recommended to disable steam as it is an unfree package, so the config wont build unless you have ```nixpkgs.config.allowUnfree = true;``` in ```configuration.nix```
    - Change filesystem stuff for your own drives/partitions
- In ```home.nix```:
    - Change username, homeDirectory
    - Choose which modules to import (Pico8 requires owning [Pico-8](https://www.lexaloffle.com/pico-8.php)) and also unfree packages enabled for ```steam-run```
    - Any modules with dotfiles will rename existing dotfiles to ```dotfile.backup``` and replace with dotfiles from the repo
