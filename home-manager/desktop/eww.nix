{ pkgs, ... }: {
  programs.eww = {
    enable = true;
    configDir = ./eww-config;
    package = pkgs.eww-wayland;
  };
}