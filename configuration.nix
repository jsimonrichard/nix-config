# configuration in this file is shared by all hosts

{ pkgs, inputs, lib, config, ... }: {
  # Enable NetworkManager for wireless networking,
  # You can configure networking with "nmtui" command.
  networking.networkmanager.enable = true;

  users.users = {
    root = {
      initialHashedPassword = "$6$q1Y863AK3UJ043Zz$EhW1r7EREDxdCS7F6UuMEtfLBtBMc3oOQ8TzPp5XNngLD3Ein.Go00c1Pt13ASRpkxavMEH.iGkZrt3toF.mU1";
      openssh.authorizedKeys.keys = [ "sshKey_placeholder" ];
    };
  };

  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  services.openssh = {
    enable = true;
    settings = { PasswordAuthentication = false; };
  };

  boot.zfs.forceImportRoot = false;

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  nixpkgs = {
    # You can add overlays here
    overlays = [
      inputs.rust-overlay.overlays.default 
      # (_: _: { home-manager = inputs.home-manager.defaultPackage.x86_64-linux; })
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Disable is you don't want unfree packages
    config.allowUnfree = true;
  };

  programs.git = {
    enable = true;
    config = {
      safe.directory = [ "/etc/nixos" ];
    };
  };

  # security = {
  #   doas.enable = true;
  #   sudo.enable = false;
  # };

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      jq # other programs
      tmux
      findutils
    ;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
