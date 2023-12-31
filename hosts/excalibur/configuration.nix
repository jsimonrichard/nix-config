{ pkgs, inputs, ... }: {
  imports = [
    ../../users/jsimonrichard
    ./nvidia.nix
  ];

  zfs-root = {
    boot = {
      devNodes = "/dev/disk/by-id/";
      bootDevices = [ "nvme-Samsung_SSD_980_PRO_with_Heatsink_2TB_S6WRNS0W537613Z" ];
      immutable.enable = false;
      removableEfi = true;
      # luks.enable = true;
    };
  };
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.kernelParams = [ ];
  networking.hostId = "0e363df6";
  networking.hostName = "excalibur";
  time.timeZone = "America/New_York";
  
  # Desktop config
  my-config = {
    desktop.kde.enable = true;
    apps.enable = true;
  };

  programs.rust.enable = true;

  environment.systemPackages = with pkgs; [
    prismlauncher
    distrobox
  ];

  fonts.packages = with pkgs; [
    meslo-lgs-nf
    inter
  ];

  # 1Password
  programs._1password.enable = true;
  programs._1password-gui.enable = true;

  # Printing
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;
  
  # VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "jsimonrichard" ];

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
