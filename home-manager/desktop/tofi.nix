{ pkgs, ... }: {
  home.packages = with pkgs; [
    tofi
  ];

  home.sessionVariables.LAUNCHER = "${pkgs.tofi}/bin/tofi-run";

  xdg.configFile."tofi/config".text = ''
    width = 100%
    height = 100%
    border-width = 0
    outline-width = 0
    padding-left = 35%
    padding-top = 35%
    result-spacing = 25
    num-results = 5
    font = monospace
    background-color = #1a1b26aa
    text-color = #c0caf5
    selection-color = #7aa2f7
  '';
}