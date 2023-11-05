{ pkgs, ... }: {
  gtk = {
    enable = true;

    theme = {
      name = "Tokyonight-Dark-BL";
      package = pkgs.tokyo-night-gtk;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.sessionVariables.GTK_THEME = "Tokyonight-Dark-BL";

  # For GNOME / libadwaita apps
  xdg.configFile."gtk-4.0/gtk.css".source = "${pkgs.tokyo-night-gtk}/share/themes/Tokyonight-Dark-BL/gtk-4.0/gtk.css";
}