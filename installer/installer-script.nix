{ pkgs, ... }: let
  installer-script = pkgs.stdenv.mkDerivation {
    name = "installer-script";
    src = ./src;
    installPhase = ''
      mkdir -p $out/bin
      cp -r $src/* $out/bin
      chmod +x $out/bin/installer-script
    '';
  };
in {
  environment.systemPackages = with pkgs; [
    git
    parted
    installer-script
  ];
}