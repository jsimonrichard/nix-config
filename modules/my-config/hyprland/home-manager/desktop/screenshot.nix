{ pkgs, ... }: {
  home.packages = with pkgs; [
    grim
    slurp
  ];
  wayland.windowManager.hyprland.settings.bind = [
    "$mod, S, exec, grim -g \"$(slurp)\""
  ];
}