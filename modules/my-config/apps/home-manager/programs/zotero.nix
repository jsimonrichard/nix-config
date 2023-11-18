{ pkgs, ... }: {
  home.packages = [ pkgs.zotero ];
  wayland.windowManager.hyprland.settings.windowrule = [
    #terms "float, title:^()$"
  ];
}