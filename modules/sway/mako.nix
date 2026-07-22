{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      font = "JetBrains Mono Nerd";
      default-timeout = 5000;
      # catppuccin colors
      text-color = "#cdd6f4ff";
      background-color = "#1e1e2eff";
      border-color = "#cba6f7ff";
      border-radius = 10;
    };
  };
}
