{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "workspace 1 silent, obsidian"
      "workspace 2 silent, brave"
    ];

    exec-once = let
      clearWindowRules = pkgs.writeScriptBin "clear-window-rules.sh" ''
        sleep 10
        hyprctl keyword windowrule "workspace unset, obsidian"
        hyprctl keyword windowrule "workspace unset, brave"
      '';
    in
    [
      "env -u WAYLAND_DISPLAY obsidian"
      "brave"
      "1password --slient"
      "${clearWindowRules}/bin/clear-window-rules.sh"
    ];
  };
}