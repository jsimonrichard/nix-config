{ pkgs, ... }: let
  pythonPackages = ps: with ps; [
    ipython
    jupyterlab
    jupyterlab-git
  ];
in
{
  home.packages = with pkgs; [
    (python3.withPackages pythonPackages)
    poetry
  ];
}