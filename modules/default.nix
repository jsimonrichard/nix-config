{ config, lib, pkgs, ... }: {
  imports = [
    ./boot
    ./fileSystems
    ./networking
    ./my-config/desktop/hyprland
    ./my-config/desktop/kde
    ./polkit_gnome.nix
    ./tuigreet.nix
  ];
}
