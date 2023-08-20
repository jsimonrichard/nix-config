{ pkgs, ... }: {
  programs.zathura = {
    enable = true;
    mappings = {
      "<C-i>" = "recolor";
    };
  };

  xdg.mimeApps.defaultApplications."application/pdf" = [
    "org.pwmt.zathura-cb.desktop"
  ];
}