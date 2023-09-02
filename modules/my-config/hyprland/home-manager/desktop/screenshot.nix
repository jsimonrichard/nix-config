{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    grim
    slurp
  ];
  wayland.windowManager.hyprland.settings.bind = [
    "$mod SHIFT, S, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%s).png"
    "$mod, S, exec, grim ~/Pictures/Screenshots/$(date +%s).png"
  ];
  # Create the screenshot directory
  home.activation.createScreenshotDirectory = lib.hm.dag.entryAfter ["linkGeneration"] ''
    $DRY_RUN_CMD mkdir -p $VERBOSE_ARG ~/Pictures/Screenshots
  '';
}