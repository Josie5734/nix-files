{ pkgs, ... }:

{
  gtk = {
    enable = true;
    # set dark theme
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    # get icons
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    # prefer dark for gtk3
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
