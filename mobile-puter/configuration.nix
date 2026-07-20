{ config, lib, pkgs, inputs, hostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # sway system config
      "${inputs.modules}/sway/sway-configuration.nix"
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # opengl/mesa acceleration
  hardware.graphics.enable = true;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # power adapter on startup
  services.blueman.enable = true; # install and enable blueman bluetooth manager

  # define hostname (set in the flake)
  networking.hostName = hostname;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  # Configure keymap
  services.xserver.xkb.layout = "gb";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."josie" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "input" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh; # use zsh
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
    neovim
    git
    kitty
    direnv
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

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # dont change this
  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
