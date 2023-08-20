{ config, lib, pkgs, ... }: {
  imports = [
    ./boot
    ./fileSystems
    ./networking
    ./my-config/hyprland
    ./polkit_gnome.nix
    ./tuigreet.nix
  ];
}
