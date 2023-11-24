{ pkgs, ... }: {
  users.users.jsimonrichard = {
    description = "J. Simon Richard";
    isNormalUser = true;
    initialHashedPassword = "$6$E.n/F.ubfsS5U6ci$liU1nFB8tJyn80dTqI.MP31E5gIB7OdhI43S.Yoj1Za1ZP4Z9pOzoNNeJRKnnMbAzkl9xodxlTcXC0s2GpXuY.";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEO5wNHZQmZ4Xkz08W0COGJy2vdPhMRLlJYdEh9ks48a" # elendil
    ];
    extraGroups = [ "wheel" "networkmanager" "audio" "docker" ];
    shell = pkgs.zsh;
  };

  home-manager.users.jsimonrichard = {
    imports = [
      ./zsh.nix
    ];
    
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

    programs.ssh.matchBlocks = {
      "Gramr" = {
        host = "gramr.jsimonrichard.com";
        user = "jsimonrichard";
      };
      "Excalibur" = {
        host = "excalibur.jsimonrichard.com";
        user = "jsimonrichard";
        port = 33805;
      };
      "excalibur" = {
        host = "excalibur";
        user = "jsimonrichard";
        port = 33805;
      };
      "Grail" = {
        host = "grail.eecs.csuohio.edu";
        user = "jarichar";
      };
    };
  };

  home-manager.users.jsimonrichard = {
    xdg.configFile."nixpkgs/config.nix".text = ''{
      allowUnfree = true;
      cudaSupport = true;
    }'';
  };
}
