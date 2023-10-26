#!/bin/bash

# active left status style
set "status-left" "\
#[fg=$edge_fg,bg=$edge_bg] ♣ #S \
#[fg=$edge_bg,bg=$background]"

# prefix highlight when pressed
set "@prefix_highlight_fg" "$hover_fg"
set "@prefix_highlight_bg" "$hover_bg"
set "@prefix_highlight_prefix_prompt" "prefix"
set "@prefix_highlight_empty_prompt" ""
set "@prefix_highlight_output_prefix" ""
set "@prefix_highlight_output_suffix" " <"

# # flags for various options
# FLAGS=" \
# #[fg=colour7]\
# #{?client_prefix,<prefix> ,}\
# #[fg=colour3]\
# #{s/-mode/ /:pane_mode}\
# #[fg=colour6]\
# #{?pane_synchronized,sync ,}\
# #[fg=colour4]\
# #{?pane_marked,mark ,}\
# #[fg=colour7]\
# #{?#{&&:#{pane_marked_set},#{!=:#{pane_marked},1}},mark ,}\
# #{?rectangle_toggle,rect ,}\
# #{?selection_present,sel ,}\
# #{?pane_dead,dead ,}\
# #{?window_zoomed_flag,zoom ,}\
# #{?window_linked,link ,}\
# #{?session_many_attached,attach ,}\
# #{?#{&&:#{session_grouped},#{!=:#{session_group_size},1}},group ,}\
# #[fg=colour5]\
# #{?client_readonly,readonly ,}"

# inactive status windows style
set "window-status-format" "\
#[fg=$background,bg=$background]\
#[fg=$foreground,bg=$background] #I > #W \
#[fg=$background,bg=$background]"

# active status windows style
set "window-status-current-format" "\
#[fg=$background,bg=$hover_bg]\
#[fg=$hover_fg,bg=$hover_bg,nobold] #I > #W \
#[fg=$hover_bg,bg=$background]"

# active right status style
set "status-right" "\
#[fg=$hover_bg,bg=$background]\
#{prefix_highlight}\
#[fg=$hover_fg,bg=$hover_bg,nounderscore,noitalics] %H:%M < %a \
#[fg=$background,bg=$hover_bg]\
#[fg=$edge_bg,bg=$background]\
#[fg=$edge_fg,bg=$edge_bg] #{USER} @ #h "
