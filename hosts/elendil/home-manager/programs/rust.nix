{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    clang
    llvmPackages.bintools
    rustup
    cargo
    pkg-config
  ];

  home.sessionPath = [
    ".cargo/bin"
  ];

  program.bash.initExtra = ''
    export PATH=$HOME/.cargo/bin:$PATH
  '';
  program.zsh.initExtra = ''
    export PATH=$HOME/.cargo/bin:$PATH
  '';
}