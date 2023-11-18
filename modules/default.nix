{ config, lib, pkgs, ... }: {
  imports = [
    ./boot.nix
    ./fileSystems.nix
    ./my-config
    ./polkit_gnome.nix
    ./tuigreet.nix
    ./rust.nix
  ];
}
