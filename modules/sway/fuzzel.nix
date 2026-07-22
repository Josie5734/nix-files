{ pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono Nerd:size=15";
      };
      colors = {
        # catppuccin mocha mauve theme
        background="1e1e2eff";
        text="cdd6f4ff";
        prompt="bac2deff";
        placeholder="7f849cff";
        input="cdd6f4ff";
        match="cba6f7ff";
        selection="585b70ff";
        selection-text="cdd6f4ff";
        selection-match="cba6f7ff";
        counter="7f849cff";
        border="cba6f7ff";
      };
      border = {
        width = 2;
        radius = 10;
      };
    };
  };
}
