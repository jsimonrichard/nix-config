{ ... }: {
  wayland.windowManager.hyprland.extraConfig = ''
    windowrule = float, ^(.blueman-manager-wrapped)$
    windowrule = size 660,420, ^(.blueman-manager-wrapped)$

    windowrule = float, ^(Spotify)$
    windowrule = float, title:zoom

    windowrule = float, title:^(Open Folder)
    windowrule = size 960,775, title:^(Open Folder)

    windowrule = float, 1Password
  '';
}