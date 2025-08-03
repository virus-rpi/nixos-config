{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.python3
    pkgs.python3Packages.pip
    pkgs.python3Packages.virtualenv
    pkgs.uv
    pkgs.jetbrains.pycharm-professional
  ];
  shellHook = ''
    echo "Python dev environment loaded."
  '';
}
