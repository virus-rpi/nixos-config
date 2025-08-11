{ pkgs, ... }:
{
  services.displayManager.gdm.enable = true;
  environment.systemPackages = with pkgs; [
  	swayfx
    swaybg
    swayidle
    swaylock
    waybar
    wofi
    grim
    slurp
  ];
}
