{ pkgs, ... }: {
  home.packages = with pkgs; [ discord ];

  wayland.windowManager.hyprland.settings.windowrule = [
    "workspace special:Discord, discord"
  ];
}