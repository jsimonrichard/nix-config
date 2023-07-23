{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "J. Simon Richard";
    userEmail = "jsimonrichard@gmail.com";
    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDYoGPQpHYvpxsvrhxZUTBj68fVHCNb6OYAWTsRVOLX5";
      gpg = {
        format = "ssh";
        "ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";
      };
      commit.gpgsign = true;
    };
  };
}