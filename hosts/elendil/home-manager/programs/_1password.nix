{ pkgs, ... }: {
  # Enable programs._1password[-gui] in nixos config

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
	      IdentityAgent ~/.1password/agent.sock
    '';
  };
  home.sessionVariables.SSH_AUTH_SOCK = "/home/jsimonrichard/.1password/agent.sock";

  programs.git.extraConfig = {
    user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDYoGPQpHYvpxsvrhxZUTBj68fVHCNb6OYAWTsRVOLX5";
    gpg = {
      format = "ssh";
      "ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";
    };
    commit.gpgsign = true;
  };

  wayland.windowManager.hyprland.settings.windowrule = [
    "float, 1Password"
  ];

  xdg.desktopEntries._1password-silent = {
    name = "1Password (Silent)";
    genericName = "Password Manager";
    comment = "1Password (Silent startup)";
    icon = "${pkgs._1password-gui}/share/icons/hicolor/256x256/apps/1password.png";
    exec = "${pkgs._1password-gui}/bin/1password --silent";
    terminal = false;
    categories = [ "Utility" ];
  };
}