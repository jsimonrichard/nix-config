{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnome.sushi
    gnome.simple-scan
  ];
}