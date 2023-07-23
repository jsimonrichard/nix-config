{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.meslo-lgs-nf;
      name = "MesloLGS NF";
      size = 16;
    };
  };
}