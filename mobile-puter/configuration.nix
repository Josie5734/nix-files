# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, hostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # opengl/mesa acceleration
  hardware.graphics.enable = true;

  networking.hostName = hostname; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # power adapter on startup
  services.blueman.enable = true; # install and enable blueman bluetooth manager

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  #
  #sway
  #

  # enable sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  # not sure if this is needed, possibly autoenabled by enabling programs.sway
  # security.pam.services.swaylock = {};
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };
  services.seatd.enable = true;

  # greetd via tuigreet
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --remember --time --cmd sway";
      user = "greeter";
    };
  };

  # install fonts
  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  # thunar
  services.gvfs.enable = true;  # enable drive mounting and stuff
  programs.xfconf.enable = true; # saves thunar preferences like sidebar

  #
  #sway
  #

  #
  #xfce
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  #xfce
  #

  # Configure keymap in X11
  services.xserver.xkb.layout = "gb";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."josie" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # other programs
  programs.zsh.enable = true; # zsh shell
  services.mullvad-vpn.enable = true; # mullvad vpn (cli)
  programs.steam = { # steam
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # base
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    kitty
    direnv

    #sway
    grim
    slurp
    sway-contrib.grimshot
    brightnessctl
  ];

  # Automatic garbage collection for old builds
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # dont change this
  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
