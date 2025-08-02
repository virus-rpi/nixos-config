{ pkgs, ... }:
{
  programs.sway.enable = true;
  services.xserver.displayManager.gdm.enable = true;
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
