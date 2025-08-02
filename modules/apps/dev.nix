{ pkgs, inputs, system, ... }:
{
  environment.packages = with pkgs; [
    jetbrains.idea-ultimate
  ];
}
