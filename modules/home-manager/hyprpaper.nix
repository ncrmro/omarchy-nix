{
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${config.xdg.configHome}/omarchy/current/background"
      ];
      wallpaper = [
        ",${config.xdg.configHome}/omarchy/current/background"
      ];
    };
  };
}
