# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ pkgs, lib, inputs, ... }: {

  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    ./desktop
    ./programs
  ];

  home.sessionVariables = {
    TERMINAL = "${pkgs.kitty}/bin/kitty";
    EDITOR = "${pkgs.neovim}/bin/nvim";
  };

  home = {
    username = "jsimonrichard";
    homeDirectory = "/home/jsimonrichard";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    pavucontrol
    gparted
  ];

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number relativenumber
    '';
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "J. Simon Richard";
    userEmail = "jsimonrichard@gmail.com";
  };
  programs.ssh.enable = true;

  xdg.enable = true;
  xdg.mimeApps.enable = true;
  xdg.configFile."mimeapps.list".force = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
