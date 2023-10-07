{ pkgs, lib, ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 350;
        height = 150;
        origin = "top-right";
        offset = "5x100";
        corner_radius = 5;
        font = "Inter 12";
        separator_color = "#7aa2f733";
        frame_color = "#7aa2f733";
        frame_width = 2;
        background = "#1a1b2699";
        mouse_right_click = "context";
        dmenu = "${pkgs.fuzzel}/bin/fuzzel --dmenu";
      };

      volume-controls = {
        appname = "volumeChange";
        history_ignore="yes";
        urgency = "low";
        timeout = "1s";
      };

      spotify = {
        appname = "Spotify";
        format = "";
      };

      z_bedtime = {
        appname = "bedtime";
        history_ignore="yes";
        urgency = "critical";
        timeout = "60s";
        background = "#ff757fdd";
        separator_color = "#ff757fff";
        frame_color = "#ff757fff";
      };
    };
  };

  wayland.windowManager.hyprland.settings.layerrule = [
    "blur, notifications"
  ];
}