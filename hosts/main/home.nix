{ pkgs, ... }:
{
  imports = [
    ../../home-modules/all.nix
  ];

  home.username = "u200b";
  home.homeDirectory = "/home/u200b";

  home.stateVersion = "25.05";
}
