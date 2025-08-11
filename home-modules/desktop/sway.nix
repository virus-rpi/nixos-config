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
    pavucontrol
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    wrapperFeatures.gtk = true;
    config = {
      terminal = "kitty";
      bars = [{
        command = "waybar";
      }];
      output."*".bg = "/run/current-system/sw/share/backgrounds/gnome/blobs-l.svg fill";
    };
    extraConfig = ''
      # swayfx settings
      corner_radius 10
      shadows enable
      shadow_blur_radius 20
      shadow_color #000000BF
      blur enable
      blur_passes 2
      blur_radius 5
      default_dim_inactive 0.2
      dim_inactive_colors.unfocused #000000FF

      layer_effects waybar {
        corner_radius 10
        shadows enable
      }
    '';
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "cpu" "memory" ];
        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        clock = {
          format = "{:%Y-%m-%d %H:%M:%S}";
        };
        cpu = {
          format = "CPU: {usage}%";
        };
        memory = {
          format = "Mem: {used:0.1f}G/{total:0.1f}G";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "muted";
          on-click = "pavucontrol";
        };
      };
    };
  };
}
