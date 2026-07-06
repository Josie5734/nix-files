
{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    autoThemeFiles.dark = "Catppuccin-Mocha";
    font.package = pkgs.nerd-fonts.jetbrains-mono;
    font.name = "JetBrainsMono";
  }
}
