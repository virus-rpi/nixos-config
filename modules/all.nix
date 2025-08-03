# dont add stuff directly in here. only import
{ pkgs, inputs, system, ... }:
{
  imports = [
    ./apps/all.nix
    ./desktop/gnome.nix
    ./desktop/sway.nix
    ./networking.nix
    ./locale.nix
    ./users.nix
    ./sound.nix
    ./misc.nix
    ./shell.nix
  ];
}
