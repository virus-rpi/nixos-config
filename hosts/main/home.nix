{ pkgs,inputs, system, ... }:
{
  home.username = "u200b";
  home.homeDirectory = "/home/u200b";

  home.stateVersion = "25.05";

  programs.fish.enable = true;
  programs.git = {
    enable = true;
    userName = "u200b";
    userEmail = "uwu@owo.computer";
  };

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    neovim
    kitty
  ];
}
