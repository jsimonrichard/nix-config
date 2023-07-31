{ pkgs, ... }: {
  home.packages = with pkgs; [
    ranger
    librsvg # for svg preview
    poppler_utils # for pdf preview
  ];
  xdg.configFile."ranger/rc.conf".source = ./rc.conf;
  xdg.configFile."ranger/scope.sh".source = ./scope.sh;
}