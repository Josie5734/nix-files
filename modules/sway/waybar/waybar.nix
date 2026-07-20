{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    # import waybar settings
    settings.mainBar = import ./settings.nix;
    # import waybar styles and put the mocha theme infront of it to apply it
    style = builtins.readFile ./mocha.css + "\n" + builtins.readFile ./style.css;
  };
}
