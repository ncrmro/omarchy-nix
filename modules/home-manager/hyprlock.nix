inputs: {
  config,
  pkgs,
  lib,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      source = "${config.xdg.configHome}/omarchy/current/theme/hyprlock.conf";
      general = {
        disable_loading_bar = true;
        no_fade_in = false;
      };
      auth = {
        fingerprint.enabled = true;
      };
      background = {
        monitor = "";
        path = "${config.xdg.configHome}/omarchy/current/background";
        blur_passes = 3;
        brightness = 0.5;
      };

      input-field = {
        monitor = "";
        size = "600, 100";
        position = "0, 0";
        halign = "center";
        valign = "center";

        inner_color = "$inner_color";
        outer_color = "$outer_color";
        outline_thickness = 4;

        font_family = "CaskaydiaMono Nerd Font";
        font_size = 32;
        font_color = "$font_color";

        placeholder_color = "$placeholder_color";
        placeholder_text = "  Enter Password 󰈷 ";
        check_color = "rgba(131, 192, 146, 1.0)";
        fail_text = "Wrong";

        rounding = 0;
        shadow_passes = 0;
        fade_on_empty = false;
      };

      label = {
        monitor = "";
        text = "\$FPRINTPROMPT";
        text_align = "center";
        color = "rgb(211, 198, 170)";
        font_size = 24;
        font_family = "CaskaydiaMono Nerd Font";
        position = "0, -100";
        halign = "center";
        valign = "center";
      };
    };
  };
}
