{ pkgs, ... }:
{
  programs.sway.enable = true;
  services.displayManager.gdm.enable = true;
  environment.systemPackages = with pkgs; [
    swaybg
    swayidle
    swaylock
    waybar
    wofi
    grim
    slurp
  ];
}
