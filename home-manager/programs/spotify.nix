{ pkgs, ... }: {
  home.packages = with pkgs; [ spotify ];

  # xdg.desktopEntries.spotify-test = {
  #   name = "Spotify Test";
  #   exec = "${pkgs.spotify}/bin/spotify %U";
  #   terminal = false;
  #   categories = [ "Application" "Music" ];
  # };
}