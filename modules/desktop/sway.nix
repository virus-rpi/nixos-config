{ pkgs, inputs, ... }:
{
  hardware.graphics.enable = true;
  services.displayManager.gdm.enable = true;
}
