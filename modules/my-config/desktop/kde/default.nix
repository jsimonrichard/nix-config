{ config, lib, pkgs, ... }:
let inherit (lib) types mkIf mkDefault mkOption lists;
in {
  options.my-config.desktop.kde = {
    enable = mkOption {
      description = "Enable my customized KDE Desktop";
      type = types.bool;
      default = false;
    };

    users = mkOption {
      description = "Add KDE configs to these users";
      type = types.listOf types.str;
    };
  };

  config = mkIf config.my-config.desktop.kde.enable ((lists.foldr (a: b: a // b) {    
    services.xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };

    programs.dconf.enable = true;

    environment.plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      oxygen
      khelpcenter
      konsole
    ];

    environment.systemPackages = with pkgs.libsForQt5; [
      skanlite
      kpeople
      kpeoplevcard
    ];

    programs.kdeconnect.enable = true;

  }) []);
  #(map (username: {
  #  #home-manager.users."${username}";
  #}) config.my-config.desktop.kde.users));
}
