{ pkgs, ... }: {
  imports = [
    ./hyprland
    # ./tofi.nix
    ./fuzzel.nix
    ./eww.nix
    # ./hyprpaper.nix
    ./swaybg.nix
    ./dunst.nix
    ./gtk.nix
    ./gnome.nix
    ./screenshot.nix
    ./swaylock.nix
    ./wlogout.nix
  ];

  home.packages = with pkgs; [ ];
}