{ config, lib, pkgs, ... }:
let inherit (lib) types mkIf mkDefault mkOption lists;
in {
  imports = [ ../../../tuigreet.nix ];

  options.my-config.desktop.hyprland = {
    enable = mkOption {
      description = "Enable my customized Hyprland Desktop";
      type = types.bool;
      default = false;
    };

    users = mkOption {
      description = "Add hyprland home manager configs to these users";
      type = types.listOf types.str;
      default = [];
    };
  };

  config = mkIf config.my-config.desktop.hyprland.enable ((lists.foldr (a: b: a // b) {
    
    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    security.pam.services.swaylock = {};
    services.greetd.environments = [ "Hyprland" ] ++ config.my-config.desktop.hyprland.users;

  })
  [{
    home-manager.users.jsimonrichard = import ./home-manager/home.nix;
  }]);
  # (map (username: {
  #   home-manager.users.${username} = import ./home-manager/home.nix;
  # }) config.my-config.desktop.hyprland.users));
}