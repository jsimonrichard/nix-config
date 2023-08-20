{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.dell-xps-13-9380
    ../../users/jsimonrichard
  ];

  # Custom zfs module config
  zfs-root = {
    boot = {
      devNodes = "/dev/disk/by-id/";
      bootDevices = [  "nvme-PC_SN730_NVMe_WDC_512GB_21355H804723" ];
      immutable = false;
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      removableEfi = true;
      kernelParams = [ ];
      sshUnlock = {
        # read sshUnlock.txt file.
        enable = false;
        authorizedKeys = [ ];
      };
    };
    networking = {
      # read changeHostName.txt file.
      hostName = "elendil";
      timeZone = "America/New_York";
      hostId = "7d670aae";
    };
  };

  programs.tmux = {
    enable = true;
    terminal = "tmux-direct";
  };

  # Desktop config
  services.greetd = {
    enable = true;
    tuigreet = {
      enable = true;
      defaultCmd = "Hyprland";
    };
  };

  my-config.desktop.hyprland = {
    enable = true;
    users = [ "jsimonrichard" ];
  };

  security.polkit = {
    enable = true;
    gnome.enable = true;
  };

  fonts.packages = with pkgs; [
    meslo-lgs-nf
    inter
  ];

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.locate = {
    enable = true;
  };

  # Printing
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  # Garbage collecting
  nix.gc = {
    automatic = true;  # Enable the automatic garbage collector
    dates = "weekly";   # When to run the garbage collector
    options = "--delete-older-than 30d";    # Arguments to pass to nix-collect-garbage
  };
}