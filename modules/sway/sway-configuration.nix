{ pkgs, ... }:

{
  # enable sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
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

  # system packages
  environment.systemPackages = with pkgs; [
    grim # screenshots
    slurp
    sway-contrib.grimshot
    brightnessctl # brightness controls
  ];
}
