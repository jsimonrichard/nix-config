{ pkgs, ... }: {
  home.packages = with pkgs; [
    gcc
    binutils
    gnumake
    pkgconfig
  ];
}