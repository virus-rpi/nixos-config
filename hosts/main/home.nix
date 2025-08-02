{ pkgs, ... }:
{
  home.username = "u200b";
  home.homeDirectory = "/home/u200b";

  programs.fish.enable = true;
  programs.git = {
    enable = true;
    userName = "u200b";
    userEmail = "uwu@owo.computer";
  };
  programs.gnome-shell = {
    enable = true;
    extensions = [{ package = pkgs.gnomeExtensions.gsconnect; }];
  };

  home.stateVersion = "25.05";
}
