{ pkgs, inputs, system, ... }:
{
  environment.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    neovim
    kitty
  ];
}
