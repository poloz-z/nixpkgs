{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      modifier = "Mod4";
      bars = [ ];

      window.border = 0;

      gaps = {
        inner = 15;
        outer = 8;
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.sakura}/bin/sakura";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi run -show drun -show-icons";
        "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
        "${modifier}+f" = "exec ${pkgs.firefox}/bin/firefox";
        "${modifier}+Shift+x" = "exec systemctl suspend";
      };

      startup = [
        {
          command = "${pkgs.polybar}/bin/polybar bottom";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.polybar}/bin/polybar top";
          always = true;
          notification = false;
        }
        {
          command = "exec i3-msg workspace 1";
          always = true;
          notification = false;
        }
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-fill --randomize $HOME/Pictures/770418.jpg";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
