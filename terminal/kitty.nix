{pkgs}:

pkgs.writeText "kitty.conf" (
  ''
font_family      SF Mono Ligaturized
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size 11.0
force_ltr no
adjust_line_height  0
adjust_column_width 0
disable_ligatures never
font_features none
box_drawing_scale 0.001, 1, 1.5, 2

cursor #cccccc
cursor_text_color #111111
cursor_shape block
cursor_beam_thickness 1.5
cursor_underline_thickness 2.0
cursor_blink_interval -1
cursor_stop_blinking_after 15.0

scrollback_lines 2000000
scrollback_pager less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER
scrollback_pager_history_size 0
wheel_scroll_multiplier 5.0
touch_scroll_multiplier 1.0

mouse_hide_wait 3.0
url_color #0087bd
url_style curly
open_url_modifiers kitty_mod
open_url_with default
url_prefixes http https file ftp
copy_on_select no
strip_trailing_spaces never
rectangle_select_modifiers ctrl+alt
terminal_select_modifiers shift
select_by_word_characters @-./_~?&=%+#
click_interval -1.0
focus_follows_mouse no
pointer_shape_when_grabbed arrow
default_pointer_shape beam
pointer_shape_when_dragging beam

enable_audio_bell no
visual_bell_duration 0.5
window_alert_on_bell yes
bell_on_tab yes
command_on_bell none

remember_window_size  no
initial_window_width 82c
initial_window_height 24c
enabled_layouts splits,grid,horizontal,vertical,stack,tall
window_resize_step_cells 2
window_resize_step_lines 2
window_border_width 0.5
draw_minimal_borders yes
window_margin_width 0
single_window_margin_width -1
window_padding_width 0
placement_strategy center
active_border_color #00ff00
inactive_border_color #cccccc
bell_border_color #ff5a00
inactive_text_alpha 1.0
hide_window_decorations no
resize_debounce_time 0.1
resize_draw_strategy static
resize_in_steps no
confirm_os_window_close 0

tab_bar_edge top
tab_bar_margin_width 0.0
tab_bar_style powerline
tab_bar_min_tabs 2
tab_switch_strategy previous
tab_fade 0.25 0.5 0.75 1
tab_separator " ┇"
tab_activity_symbol none
tab_title_template "{title}"
active_tab_title_template none
active_tab_foreground   #000
active_tab_background   #eee
active_tab_font_style   bold-italic
inactive_tab_foreground #444
inactive_tab_background #999
inactive_tab_font_style normal
tab_bar_background none

wayland_titlebar_color system

foreground #dddddd
background #000000

background_opacity 0.82
background_image none
background_image_layout tiled
background_image_linear no
dynamic_background_opacity no
background_tint 0.0
dim_opacity 0.75
selection_foreground #000000
selection_background #fffacd

color0 #000000
color8 #767676
color1 #cc0403
color9 #f2201f
color2  #19cb00
color10 #23fd00
color3  #cecb00
color11 #fffd00
color4  #0d73cc
color12 #1a8fff
color5  #cb1ed1
color13 #fd28ff
color6  #0dcdcd
color14 #14ffff
color7  #dddddd
color15 #ffffff
mark1_foreground black
mark1_background #98d3cb
mark2_foreground black
mark2_background #f2dcd3
mark3_foreground black
mark3_background #f274bc

shell .
editor .
close_on_child_death no
allow_remote_control no
listen_on none
update_check_interval 0
startup_session none
clipboard_control write-clipboard write-primary
allow_hyperlinks yes
term xterm-kitty

linux_display_server auto

kitty_mod ctrl+shift
clear_all_shortcuts no
map kitty_mod+c copy_to_clipboard
map kitty_mod+v  paste_from_clipboard
map kitty_mod+s  paste_from_selection
map shift+insert paste_from_selection

map kitty_mod+up        scroll_line_up
map kitty_mod+k         scroll_line_up
map kitty_mod+down      scroll_line_down
map kitty_mod+j         scroll_line_down
map page_up             scroll_page_up
map page_down           scroll_page_down
map kitty_mod+home      scroll_home
map kitty_mod+end       scroll_end
map kitty_mod+h         show_scrollback

map kitty_mod+enter new_window
map kitty_mod+n no_op
map kitty_mod+w   close_window
map ctrl+tab      next_window
map kitty_mod+tab previous_window
map kitty_mod+f   move_window_forward
map kitty_mod+b   move_window_backward
map kitty_mod+`   move_window_to_top
map kitty_mod+r   start_resizing_window

map ctrl+page_down      next_tab
map ctrl+page_up        previous_tab
map kitty_mod+t         new_tab
map kitty_mod+q         close_tab
map kitty_mod+page_down move_tab_forward
map kitty_mod+page_up   move_tab_backward
map kitty_mod+alt+t     set_tab_title

map kitty_mod+z rotate
map kitty_mod+l next_layout
map kitty_mod+2 goto_layout splits
map kitty_mod+2 goto_layout grid
map kitty_mod+3 goto_layout horizontal
map kitty_mod+4 goto_layout vertical
map kitty_mod+5 goto_layout stack
map kitty_mod+6 goto_layout tall
map kitty_mod+7 no_op
map kitty_mod+8 no_op
map kitty_mod+9 no_op
map kitty_mod+0 no_op
map kitty_mod+o launch --location=hsplit --cwd=current
map kitty_mod+e launch --location=vsplit --cwd=current

map kitty_mod+equal     change_font_size all +2.0
map kitty_mod+minus     change_font_size all -2.0
map kitty_mod+backspace change_font_size all 0

map kitty_mod+p>f kitten hints --type path --program -
map kitty_mod+p>shift+f kitten hints --type path
map kitty_mod+p>l kitten hints --type line --program -
map kitty_mod+p>w kitten hints --type word --program -
map kitty_mod+p>h kitten hints --type hash --program -
map kitty_mod+p>n kitten hints --type linenum
map kitty_mod+p>y kitten hints --type hyperlink

map kitty_mod+f11    toggle_fullscreen
map kitty_mod+f10    toggle_maximized
map kitty_mod+u      kitten unicode_input
map kitty_mod+f2     edit_config_file
map kitty_mod+escape kitty_shell window

map kitty_mod+a>m    set_background_opacity +0.1
map kitty_mod+a>l    set_background_opacity -0.1
map kitty_mod+a>1    set_background_opacity 1
map kitty_mod+a>d    set_background_opacity default
map kitty_mod+delete clear_terminal reset active
  ''
)
