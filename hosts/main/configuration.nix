{ pkgs, ... }:
{
  imports = [
    ./../../modules/all.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";

  system.stateVersion = "25.05";
}