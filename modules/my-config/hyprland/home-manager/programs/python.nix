{ pkgs, ... }: let
  pythonPackages = ps: with ps; [
    ipython
  ];
in
{
  home.packages = with pkgs; [
    (python3.withPackages pythonPackages)
  ];
}