{ ... }: {
  wayland.windowManager.hyprland.settings.windowrule = [
    "float, ^(.blueman-manager-wrapped)$"
    "size 660,420, ^(.blueman-manager-wrapped)$"

    "float, ^(Spotify)$"
    "float, title:zoom"

    "float, title:^(Open Folder)"
    "size 960,775, title:^(Open Folder)"

    "float, 1Password"

    "float, title:^(ranger)$"
  ];
}