{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnome.nautilus
    nautilus-open-any-terminal
    gnome.sushi
    gnome.simple-scan
  ];
}