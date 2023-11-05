{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.dell-xps-13-9380
    ../../users/jsimonrichard
    ./bedtime.nix
    ./rust.nix
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

  # Desktop config
  my-config.desktop.kde = {
    enable = true;
  };

  home-manager.users.jsimonrichard = import ./home-manager/home.nix;

# security.polkit = {
#   enable = true;
#   gnome.enable = false;
# };

  fonts.packages = with pkgs; [
    meslo-lgs-nf
    inter
  ];

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

  # 1Password
  programs._1password.enable = true;
  programs._1password-gui.enable = true;

  services.locate = {
    enable = true;
  };

  # Printing
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  environment.systemPackages = with pkgs; [
    system-config-printer
    vulkan-tools
    
    winetricks
    wineWowPackages.waylandFull

    jetbrains.rust-rover
  ];

  # Finger print reader
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "jsimonrichard" ];

  # Garbage collecting
  nix.gc = {
    automatic = true;  # Enable the automatic garbage collector
    dates = "weekly";   # When to run the garbage collector
    options = "--delete-older-than 30d";    # Arguments to pass to nix-collect-garbage
  };
}
