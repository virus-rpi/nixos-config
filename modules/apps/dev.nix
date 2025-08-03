{ pkgs, ... }:
let
  pythonEnv = pkgs.writeShellScriptBin "python-env" ''
    exec nix develop /etc/nixos#python
  '';
  pythonIDE = pkgs.writeShellScriptBin "python-ide" ''
    exec nix develop /etc/nixos#python --command pycharm-professional "$@"
  '';
in {
  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    pythonEnv
    pythonIDE
  ];
}
