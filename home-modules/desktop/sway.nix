{pkgs, ...}:
{
  home.packages = with pkgs; [
    brightnessctl
    grim
    pulseaudio
    swayidle
    swaylock
    wmenu
    swaybg
    wofi
    wl-clipboard
    mako
    waybar
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    wrapperFeatures.gtk = true;
    config.terminal = "kitty";
  };
}
