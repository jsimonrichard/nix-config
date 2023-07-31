{ pkgs, ... }: {
  home.packages = with pkgs; [ hyprpaper ];
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/jsimonrichard/Wallpapers/milky-way-g0a0547461_1920.jpg
    wallpaper = eDP-1, /home/jsimonrichard/Wallpapers/milky-way-g0a0547461_1920.jpg
    wallpaper = DP-1, /home/jsimonrichard/Wallpapers/milky-way-g0a0547461_1920.jpg
  '';
}