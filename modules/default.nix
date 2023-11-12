{ config, lib, pkgs, ... }: {
  imports = [
    ./boot.nix
    ./fileSystems.nix
    ./my-config/desktop/hyprland
    ./my-config/desktop/kde
    ./polkit_gnome.nix
    ./tuigreet.nix
    ./rust.nix
  ];
}
