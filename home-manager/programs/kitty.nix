{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.meslo-lgs-nf;
      name = "MesloLGS NF";
      size = 14;
    };
    shellIntegration = {
      enableZshIntegration = true;
    };
    extraConfig = ''
      confirm_os_window_close -1
      background_opacity 0.7
    '';
    theme = "Tokyo Night";
  };
}