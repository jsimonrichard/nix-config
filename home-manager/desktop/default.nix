{ pkgs, ... }: {
  imports = [
    ./hyprland
    # ./tofi.nix
    ./fuzzel.nix
    ./eww.nix
    ./hyprpaper.nix
    ./dunst.nix
    ./gtk.nix
    ./gnome.nix
    ./screenshot.nix
  ];
}