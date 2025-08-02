{ pkgs, inputs, system, ... }:
{
  home.username = "u200b";
  home.homeDirectory = "/home/u200b";

  programs.fish.enable = true;
  programs.git = {
    enable = true;
    userName = "u200b";
    userEmail = "uwu@owo.computer";
  };

  home.stateVersion = "25.05";
}
