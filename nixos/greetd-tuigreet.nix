{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --user-menu --asterisks --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    Hyprland
  '';
}