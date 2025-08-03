{ pkgs, ... }:
let
  pythonEnv = pkgs.writeShellScriptBin "python-env" ''
    exec nix develop /etc/nixos#python --command ${pkgs.fish}/bin/fish
  '';
  pythonIDE = pkgs.writeShellScriptBin "python-ide" ''
    exec nix develop /etc/nixos#python --command pycharm-professional "$@"
  '';
  vlangEnv = pkgs.writeShellScriptBin "vlang-env" ''
    exec nix develop /etc/nixos#v --command ${pkgs.fish}/bin/fish
  '';
  vlangIDE = pkgs.writeShellScriptBin "vlang-ide" ''
    exec nix develop /etc/nixos#v --command clion "$@"
  '';
in {
  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    pythonEnv
    pythonIDE
    vlangEnv
    vlangIDE
  ];
}
