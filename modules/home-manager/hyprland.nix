inputs: {
  config,
  pkgs,
  ...
}: {
  imports = [./hyprland/configuration.nix];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    # Disabled since we   programs.hyprland.withUWSM is enabled
    systemd.enable = false;
  };
  services.hyprpolkitagent.enable = true;
}
