{ lib, pkgs, ... }:
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

  volumeChange = pkgs.writeShellScript "volume-change" ''
    # Arbitrary but unique message tag
    msgTag="myvolume"

    # Change the volume using alsa(might differ if you use pulseaudio)
    wpctl $@ > /dev/null

    # Query wpctl for the current volume and whether or not the speaker is muted
    volume="$(wpctl get-volume $2 | awk '{print $2 * 100}')"
    mute="$(wpctl get-volume $2 | awk '{print $3}')"
    if [[ $volume == 0 || "$mute" == "[MUTED]" ]]; then
      # Show the sound muted notification
      dunstify -a "volumeChange" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
    else
      # Show the volume notification
      dunstify -a "volumeChange" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
      -h int:value:"$volume" "Volume: $volume%"
    fi
  '';
in
{
  home.packages = with pkgs; [
    brightnessctl
  ];

  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";

    bind = [
      "$mod, Q, killactive,"
      "$mod, V, togglefloating,"
      "$mod, F, fullscreen, 0"
      "SUPER, S, exec, ${pkgs.writeShellScript "change-special-workspace" ''
        {
          echo None
          hyprctl workspaces -j | jq -r '.[] | .name' | grep special | sed 's/special://'
        } | fuzzel -d | sed '1s;^;special:;' | xargs hyprctl dispatch workspace
      ''}"
      "SUPER, escape, workspace, special:None"

      # Scroll through workspaces using $mod + SCROLL
      "$mod, mouse_down, workspace, e-1"
      "$mod, mouse_up, workspace, e+1"

      # Brightness
      ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ",XF86MonBrightnessUp, exec, brightnessctl s +5%"

      # Speaker Mute
      ",XF86AudioMute, exec, ${volumeChange} set-mute @DEFAULT_AUDIO_SINK@ toggle"
      # Mic Mute
      "CTRL, XF86AudioMute, exec, ${volumeChange} set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
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

    # Repeates when held
    binde = [
      # Speaker Volume
      ",XF86AudioLowerVolume, exec, ${volumeChange} set-volume @DEFAULT_AUDIO_SINK@ 2%-"
      ",XF86AudioRaiseVolume, exec, ${volumeChange} set-volume @DEFAULT_AUDIO_SINK@ 2%+"
      # Mic Volume
      "CTRL, XF86AudioLowerVolume, exec, ${volumeChange} set-volume @DEFAULT_AUDIO_SOURCE@ 2%-"
      "CTRL, XF86AudioRaiseVolume, exec, ${volumeChange} set-volume @DEFAULT_AUDIO_SOURCE@ 2%+"
    ];

    bindm = [
      # Move/resize windows with $mod + LMB/RMB and dragging
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    # Works even if the screen is locked
    bindl = [
      "$mod CTRL SHIFT, Q, exit,"
    ];
  };
}