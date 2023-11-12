{ pkgs, inputs, config, ... }: {
  imports = [
    ../../users/jsimonrichard
  ];

  zfs-root = {
    boot = {
      devNodes = "/dev/disk/by-id/";
      bootDevices = [ "" ];
      immutable.enable = false;
      removableEfi = true;
      luks.enable = true;
    };
  };
  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelParams = [ ];
  networking.hostId = "0e363df6";
  networking.hostName = "excalibur";
  time.timeZone = "America/New_York";
  
  # Desktop config
  my-config.desktop.kde = {
    enable = true;
  };

  programs.rust.enable = true;

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

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}