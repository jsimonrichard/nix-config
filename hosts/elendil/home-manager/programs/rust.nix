{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    (rust-bin.stable.latest.default.override {
      extensions = ["rust-src"];
    })
    rusty-man
  ];

  home.sessionPath = [
    ".cargo/bin"
  ];
}