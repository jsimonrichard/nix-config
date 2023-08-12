{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1a1b26";
      
      bs-hl-color = "f7768e";
      caps-lock-key-hl-color = "e0af68";
      caps-lock-bs-hl-color = "f7768e";
      
      separator-color = "00000000";
      
      key-hl-color = "7aa2f7";
      
      ring-color = "7aa2f733";
      ring-clear-color = "e0af68";
      ring-wrong-color = "f7768e";
      ring-caps-lock-color  = "7aa2f7";
      ring-ver-color = "7aa2f7";
      
      text-color = "c0caf5";
      
      inside-color = "1a1b26";
      inside-clear-color = "e0af68";
      inside-ver-color = "7aa2f7";
      inside-wrong-color = "f7768e";
      
      line-color = "00000000";
      line-caps-lock-color = "00000000";
      line-clear-color = "e0af68";
      line-ver-color = "7aa2f7";
      line-wrong-color = "f7768e";

      font = "Inter";
      font-size = 24;

      indicator-idle-visible = false;
      indicator-radius = 100;
      indicator-thickness = 30;
      show-failed-attempts = true;
    };
  };

  wayland.windowManager.hyprland.settings.bind = [
    ",switch:Lid Switch , exec, ${pkgs.swaylock}/bin/swaylock"
  ];
}