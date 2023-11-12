{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    ../../users/jsimonrichard
  ];

  nixpkgs.config.cudaSupport = true;

  zfs-root = {
    boot = {
      devNodes = "/dev/disk/by-id/";
      bootDevices = [ "nvme-WDC_WDS100T2B0C-00PXH0_202880802072" ];
      immutable.enable = false;
      removableEfi = true;
      luks.enable = false;
    };
  };
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelParams = [ ];
  networking.hostId = "84db98b8";
  networking.hostName = "gramr";
  time.timeZone = "America/New_York";
  
  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.logind.lidSwitch = "ignore";

  home-manager.users.jsimonrichard = {
    xdg.configFile."nixpkgs/config.nix".text = "{ allowUnfree = true; cudaSupport = true; }";
  };
}
