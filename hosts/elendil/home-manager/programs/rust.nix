{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    (rust-bin.stable.latest.default.override {
      extensions = ["rust-src"];
    })
  ];

  home.sessionPath = [
    ".cargo/bin"
  ];
}