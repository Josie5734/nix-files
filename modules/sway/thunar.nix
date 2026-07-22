{ pkgs, ... }:

{
  # note:
  # requires these 2 options in configuration.nix
  # services.gvfs.enable = true;  ## enable drive mounting and stuff
  # programs.xfconf.enable = true; ## saves thunar preferences like sidebar

  home.packages = with pkgs; [
    thunar # thunar file manager
    xarchiver # zip manager
    thunar-archive-plugin # integrate into thunar
    tumbler # preview thumbnails
  ];
}
