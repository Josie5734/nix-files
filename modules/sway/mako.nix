{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      font = "JetBrains Mono Nerd";
    };
  };
}
