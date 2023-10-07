{ pkgs, ... }: {
  home.packages = with pkgs; [ spotify ];

  wayland.windowManager.hyprland.settings.windowrule = [
    "workspace special:Spotify, title:^(Spotify)$"
  ];
}