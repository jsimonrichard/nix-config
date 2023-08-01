{ lib, ... }:
let
  workspaces = 
    (map
      (n: {
        name = toString n;
        key = toString n;
      })
      (lib.range 1 9)
    )
    ++ [{
      name = "10";
      key = "0";
    }]
    ++ (map (n: {
      name = "F${toString n}";
      key = "F${toString n}";
    }) (lib.range 1 12));
  
  # Map keys to hyprland directions
  directions = rec {
    left = "l"; right = "r"; up = "u"; down = "d";
    h = left; l = right; k = up; j = down;
  };
in
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";

    bind = [
      "$mod, Q, killactive,"
      "$mod CTRL SHIFT, Q, exit,"
      "$mod, V, togglefloating,"

      # Scroll through workspaces using $mod + SCROLL
      "$mod, mouse_down, workspace, e-1"
      "$mod, mouse_up, workspace, e+1"

      # Brightness
      ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ",XF86MonBrightnessUp, exec, brightnessctl s +5%"

      # Speaker Volume
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
      ",XF86AudioMute , exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      # Mic Volume
      "CTRL, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%-"
      "CTRL, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%+"
      "CTRL, XF86AudioMute , exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggl"
    ] ++
    # Switch to workspace
    (map (w:
      "$mod, ${w.key}, workspace, ${w.name}"
    ) workspaces) ++
    # Move active window to workspace
    (map (w:
      "$mod SHIFT, ${w.key}, movetoworkspace, ${w.name}"
    ) workspaces) ++
    # Move focus
    (lib.mapAttrsToList (key: direction: 
      "$mod, ${key}, movefocus, ${direction}"
    ) directions) ++
    # Swap windows
    (lib.mapAttrsToList (key: direction:
      "SUPERSHIFT,${key},swapwindow,${direction}"
    ) directions);

    bindm = [
      # Move/resize windows with $mod + LMB/RMB and dragging
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}