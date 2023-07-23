{ inputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [
    dunst
    hyprpaper
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    extraConfig =
      ((import ./monitors.nix {
        inherit lib;
        inherit (config) monitors;
      }) +
      import ./keybinds.nix {
        inherit (config) home;
        inherit pkgs;
      }) +
      (import ./config.nix {
        inherit (config) home;
        inherit pkgs;
      });
  };
}