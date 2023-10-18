{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    clang
    llvmPackages.bintools
    rustup
    cargo
    pkg-config
  ];
}