{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {

    };
    settings.mainBar = {
      # overall settings
      layer = "top";
      position = "top";
      mode = "dock";
      margin-left = 14;
      margin-right = 14;
      margin-top = 10;
      margin-bottom = 0;
      spacing = 5;
      exlusive = true;
      passthrough = false;
      gtk-layer-shell = true;
      reload_style_onChange = true;

      # declare module positions
      modules-left = [
        "sway/workspaces"
        "sway/scratchpad"
        "mpris"
      ];
      modules-center = [
        "group/keybidle"
        "clock#day"
        "clock#mins"
        "clock#date"
        "pulseaudio"
      ];
      modules-right = [
        "network"
        "group/laptop"
        "group/hardware"
      ];

      # define module settings

      # left #
      "sway/scratchpad" = {
        format = "{icon} {count}";
        show-empty = false;
        format-icons = ["" ""];
        tooltip = false;
      };
      "mpris" = {
     	  format = "[{player_icon}] {title} - [{position}/{length}]";
     	  format-paused = "[{status_icon}] {title - [{position}/{length}]";
     	  player-icons = {
      		  default = "🎵";
      		  mpv = "▶";
     	  };
     	  status-icons = {
      		  paused = "⏸";
     	  };
     	  interval = 1;
      };
      # left #

      # middle #
      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = " ";
          deactived = " ";
        };
      };

      "keyboard-state" = {
        numlock = false;
        capslock = false;
        format = "{icon}";
        format-icons = {
          locked = "󰬈 ";
          unlocked = "󰬈 ";
        };
      };

      "group/keybidle" = {
        orientation = "horizontal";
        modules = [
          "idle_inhibitor"
          "keyboard-state"
        ];
      };

      "clock#day" = {
        format = "{:%a}";
        tooltip = false;
      };

      "clock#mins" = {
        format = "{:%H:%M}";
        tooltip = false;
      };

      "clock#date" = {
        format = "{:%d:%m}";
        tooltip = false;
      };

      "pulseaudio" = {
        format = " {volume}%";
        format-muted = "󰟎 {volume}%";
        scroll-step = 1;
        on-click = "pwvucontrol";
      };
      # middle #

      # right #
      "network" = {
        interface = "wlp1s0";
        format-wifi = "󰖩 ";
        format-ethernet = "󰌗 ";
        format-disconnected = "󰖩";
        tooltip = true;
        tooltip-format = "{essid}";
        interval = 5;
      };

      "temperature" = {
        thermal-zone = 0;
        hwmon-path = "/sys/class/thermal/thermal_zone1/temp";
        format = " {temperatureC}C";
      };

      "backlight" = {
        format = "{icon}{percent}%";
        format-icons = ["󰃝 " "󰃟 " "󰃞 "];
        tooltip = false;
      };

      "battery" = {
        interval = 60;
        states = {
          ok = 70;
          warning = 25;
          critical = 10;
        };
        format = "{icon}{capacity}%";
        format-icons = ["󰁺" "󰁼" "󰁾" "󰂀" "󰁹"];
        format-charging = "󰂄{capacity}%";
        tooltip = true;
        tooltip-format-charging = "charging";
        events = {
          on-discharging-critical = "notify-send -u critical 'battery low!'";
        };
      };

      "group/laptop" = {
        orientation = "horizontal";
        modules = [
          "temperature"
          "backlight"
          "battery"
        ];
      };

      "memory" = {
        format = " {}%";
        interval = 5;
      };

      "cpu" = {
        format = " {usage}% ";
        tooltip = false;
        interval = 5;
      };

      "group/hardware" = {
        orientation = "horizontal";
        modules = [
          "cpu"
          "memory"
        ];
      };
      # right #
    };
    # style =
      # ''
        # * = {
          # font-family = JetBrains Mono Nerd Font;
          # font-size = "15px";
        # };
      # '' ;
  };
}
