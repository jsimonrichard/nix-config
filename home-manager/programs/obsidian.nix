{ pkgs, ... }: {
  home.packages = with pkgs; [ obsidian ];

  xdg.desktopEntries.obsidian-xwayland = {
    name = "Obsidian (XWayland)";
    icon = "obsidian";
    genericName = "Notes";
    exec = "env -u WAYLAND_DISPLAY obsidian %U";
    terminal = false;
    categories = [ "Application" ];
    mimeType = [ "x-scheme-handler/obsidian" ];
  };
}