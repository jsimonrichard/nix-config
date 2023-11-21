{ pkgs, inputs, ... }: {
  #home.packages = with pkgs; [
    # clang
    # llvmPackages.bintools
    # rustup
    # cargo
    # pkg-config
  #];

  home.sessionPath = [
    "/home/jsimonrichard/.cargo/bin"
  ];
}