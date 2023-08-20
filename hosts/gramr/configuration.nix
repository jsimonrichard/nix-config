{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    ../../users/jsimonrichard
  ];

  # Custom zfs module config
  zfs-root = {
    boot = {
      devNodes = "/dev/disk/by-id/";
      bootDevices = [ "nvme-WDC_WDS100T2B0C-00PXH0_202880802072" ];
      immutable = false;
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      removableEfi = true;
      kernelParams = [ ];
      sshUnlock = {
        # read sshUnlock.txt file.
        enable = false;
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEO5wNHZQmZ4Xkz08W0COGJy2vdPhMRLlJYdEh9ks48a" # elendil
        ];
      };
    };
    networking = {
      # read changeHostName.txt file.
      hostName = "gramr";
      timeZone = "America/New_York";
      hostId = "84db98b8";
    };
  };

  programs.tmux = {
    enable = true;
    terminal = "tmux-direct";
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

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
