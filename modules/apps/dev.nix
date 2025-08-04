{ pkgs, ... }:
let
  pythonEnv = pkgs.writeShellScriptBin "python-env" ''
    exec nix develop /etc/nixos#python --command ${pkgs.fish}/bin/fish
  '';
  pythonIDE = pkgs.writeShellScriptBin "python-ide" ''
    exec nix develop /etc/nixos#python --command pycharm-professional "$@"
  '';
  vlangEnv = pkgs.writeShellScriptBin "vlang-env" ''
    exec nix develop /etc/nixos#vlang --command ${pkgs.fish}/bin/fish
  '';
  vlangIDE = pkgs.writeShellScriptBin "vlang-ide" ''
    exec nix develop /etc/nixos#vlang --command clion "$@"
  '';
in {
  environment.systemPackages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [
      jetbrains.plugins.github-copilot-fixed
      "nixidea"
    ])
    pythonEnv
    pythonIDE
    vlangEnv
    vlangIDE
  ];
}
