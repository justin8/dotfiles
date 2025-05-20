{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bash
    zsh
  ];
}
