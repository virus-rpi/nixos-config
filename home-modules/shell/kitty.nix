{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    settings = {
      enable_wayland = "yes";
      hide_window_decorations = "no";
      confirm_os_window_close = 1;

      shell = "${pkgs.fish}/bin/fish";

      font_family = "JetBrains Mono";
      font_size = "11.0";
      background_opacity = "0.95";
      window_padding_width = 4;

      active_tab_foreground = "#FFFFFF";
      active_tab_background = "#2E3440";
      inactive_tab_foreground = "#D8DEE9";
      inactive_tab_background = "#3B4252";
      tab_bar_background = "#2E3440";
      tab_title_template = "{title}";
      tab_bar_style = "powerline";

      scrollback_lines = 10000;
      cursor = "#81A1C1";
      selection_foreground = "#000000";
      selection_background = "#E5E9F0";
    };

    keybindings = {
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_window";
    };
  };
}
