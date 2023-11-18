{ config, lib, pkgs, ... }:
let inherit (lib) types mkIf mkDefault mkOption lists;
in {
  imports = [ ];

  options.my-config.apps.enable = mkOption {
    description = "Enable my customized apps";
    type = types.bool;
    default = false;
  };

  config = mkIf config.my-config.apps.enable ((lists.foldr (a: b: a // b) {
  })
  [{
    home-manager.users.jsimonrichard = import ./home-manager/home.nix;
  }]);
  # (map (username: {
  #   home-manager.users.${username} = import ./home-manager/home.nix;
  # }) config.my-config.desktop.hyprland.users));
}