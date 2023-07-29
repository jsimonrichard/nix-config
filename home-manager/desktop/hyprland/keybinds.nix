{ home, pkgs, ... }:
let
  inherit (home.sessionVariables) TERMINAL BROWSER EDITOR LAUNCHER;
in
''
$mainMod = ALT

bind = $mainMod, Return, exec, ${TERMINAL}
bind = $mainMod, T, exec, ${TERMINAL}
bind = $mainMod, Q, killactive,
bind = SUPERCONTROLSHIFT, Q, exit,
bind = $mainMod, W, exec, ${BROWSER}
bind = $mainMod, V, togglefloating, 
bindr = SUPER, Super_L, exec, hyprctl dispatch -- "exec $(${LAUNCHER}) >/home/jsimonrichard/tofi.log 2>&1"

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e-1
bind = $mainMod, mouse_up, workspace, e+1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Brightness
bind = ,XF86MonBrightnessDown, exec, brightnessctl s 5%-
bind = ,XF86MonBrightnessUp, exec, brightnessctl s +5%

# Volume
bind = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
bind = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
bind = ,XF86AudioMute , exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bind = CTRL, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%-
bind = CTRL, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%+
bind = CTRL, XF86AudioMute , exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
''