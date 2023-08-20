{ pkgs, ... }: {
  users.users.jsimonrichard = {
    description = "J. Simon Richard";
    isNormalUser = true;
    initialHashedPassword = "$6$E.n/F.ubfsS5U6ci$liU1nFB8tJyn80dTqI.MP31E5gIB7OdhI43S.Yoj1Za1ZP4Z9pOzoNNeJRKnnMbAzkl9xodxlTcXC0s2GpXuY.";
    openssh.authorizedKeys.keys = [];
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = pkgs.zsh;
  };

  home-manager.users.jsimonrichard = {
    home = {
      username = "jsimonrichard";
      homeDirectory = "/home/jsimonrichard";

      sessionVariables = {
        EDITOR = "${pkgs.neovim}/bin/nvim";
      };

      # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
      stateVersion = "23.05";
    };

    programs.git = {
      userName = "J. Simon Richard";
      userEmail = "jsimonrichard@gmail.com";
    };
  };
}