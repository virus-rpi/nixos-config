# dont add stuff directly in here. only import
{ pkgs, ... }:
{
  imports = [
    ./desktop/gnome.nix
    ./desktop/sway.nix
    ./git.nix
    ./shell/all.nix
    ./dev.nix
  ];
}
