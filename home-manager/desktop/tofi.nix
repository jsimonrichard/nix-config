{ pkgs, ... }: {
  home.packages = with pkgs; [
    tofi
  ];

  home.sessionVariables.LAUNCHER = "${pkgs.tofi}/bin/tofi-drun";

  xdg.configFile."tofi/config".text = ''
    anchor = top
    width = 100%
    height = 30
    horizontal = true
    font-size = 14
    prompt-text = " run: "
    font = monospace
    outline-width = 0
    border-width = 0
    background-color = #000000
    min-input-width = 120
    result-spacing = 15
    padding-top = 0
    padding-bottom = 0
    padding-left = 0
    padding-right = 0
  '';
}