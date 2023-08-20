{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    ../../users/jsimonrichard
  ];

  # Custom zfs module config
  zfs-root = {
    boot = {
      devNodes = "/dev/disk/by-id/";
      bootDevices = [  "..." ];
      immutable = false;
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      removableEfi = true;
      kernelParams = [ ];
      sshUnlock = {
        # read sshUnlock.txt file.
        enable = false;
        authorizedKeys = [];
      };
    };
    networking = {
      # read changeHostName.txt file.
      hostName = "gramr";
      timeZone = "America/New_York";
      hostId = "...";
    };
  };

  programs.tmux = {
    enable = true;
    terminal = "tmux-direct";
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;;

  # Garbage collecting
  nix.gc = {
    automatic = true;  # Enable the automatic garbage collector
    dates = "weekly";   # When to run the garbage collector
    options = "--delete-older-than 30d";    # Arguments to pass to nix-collect-garbage
  };

  environment.systemPackages = [
    pkgs._1password
  ];
}
