{ pkgs, ... }: {
  programs.eww = {
    enable = true;
    configDir = ./eww;
    package = pkgs.eww-wayland;
  };

  wayland.windowManager.hyprland.settings = {
    "exec-once" = [
      "${pkgs.eww-wayland}/bin/eww daemon >/home/jsimonrichard/eww.log 2>&1 && ${pkgs.eww-wayland}/bin/eww open bar"
    ];
    layerrule = [
      "blur, gtk-layer-shell"
    ];
  };
}