{ pkgs, ... }: {
  home.packages = with pkgs; [
    gcc
    binutils
    gnumake
    pkg-config
  ];
}