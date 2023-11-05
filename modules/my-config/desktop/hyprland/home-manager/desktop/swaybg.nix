{ pkgs, ... }: {
  home.packages = with pkgs; [ swaybg ];
  wayland.windowManager.hyprland.settings.exec-once = [
    "swaybg -o '*' -i ~/Wallpapers/milky-way-g0a0547461_1920.jpg -m fill"
  ];
}