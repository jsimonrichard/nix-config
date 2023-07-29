{ pkgs, ... }: {
  home.packages = with pkgs; [
    libgccjit
    gnumake
  ];
}