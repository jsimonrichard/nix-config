{ pkgs, lib, config, ... }:
let inherit (lib) types mkIf mkOption;
in {
  options.programs.rust.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable rust and cargo support";
  };

  config = mkIf config.programs.rust.enable {
    environment.systemPackages = with pkgs; [
      rustup
      cargo
      clang
      llvmPackages.bintools
      pkg-config
    ];
  };
}