{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.vlang
    pkgs.jetbrains.clion
  ];
  shellHook = ''
    echo "V dev environment loaded."
  '';
}
