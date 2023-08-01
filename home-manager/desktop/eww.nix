{ pkgs, ... }: {
  programs.eww = {
    enable = true;
    configDir = ./eww;
    package = pkgs.eww-wayland;
  };

  wayland.windowManager.hyprland.extraConfig = ''
    exec-once = ${pkgs.eww-wayland}/bin/eww daemon >/home/jsimonrichard/eww.log 2>&1
  '';
}