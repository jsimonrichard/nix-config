{ pkgs, ... }: {
  imports = [
    ./hyprland
    ./tofi.nix
    ./eww.nix
    ./hyprpaper.nix
    ./dunst.nix
    ./gtk.nix
    ./gnome.nix
  ];
}