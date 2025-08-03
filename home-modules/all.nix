# dont add stuff directly in here. only import
{ pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./git.nix
    ./shell/all.nix
    ./dev.nix
  ];
}
