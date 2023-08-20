{ pkgs, ... }: {
  home.packages = with pkgs; [
    _1password
    _1password-gui
  ];

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
	      IdentityAgent ~/.1password/agent.sock
    '';
  };

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
}