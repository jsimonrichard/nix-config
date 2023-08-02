{ pkgs, ... }: {
  home.packages = with pkgs; [
    tofi
  ];

  xdg.configFile."tofi/config".text = ''
    width = 100%
    height = 100%
    border-width = 0
    outline-width = 0
    padding-left = 35%
    padding-top = 35%
    result-spacing = 25
    num-results = 5
    font = monospace
    background-color = #1a1b26aa
    text-color = #c0caf5
    selection-color = #7aa2f7
  '';

  wayland.windowManager.hyprland.extraConfig = ''
    bindr = SUPER, Super_L, exec, hyprctl dispatch -- exec $(${builtins.replaceStrings ["\n"] [""] "
      ${pkgs.tofi}/bin/tofi-run
          --hint-font false
          --ascii-input true
          --font '${pkgs.meslo-lgs-nf}/share/fonts/truetype/MesloLGS NF Regular.ttf'
    "})
    layerrule = noanim, launcher
  '';
}