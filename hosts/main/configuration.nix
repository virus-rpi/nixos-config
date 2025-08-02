{ pkgs, ... }:
{
  imports = [
    ../../modules/desktop/gnome.nix
    ../../modules/desktop/sway.nix
    ../../modules/networking.nix
    ../../modules/locale.nix
    ../../modules/users.nix
    ../../modules/sound.nix
    ../../modules/misc.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";
}
