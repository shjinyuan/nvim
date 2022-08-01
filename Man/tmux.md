# tmux.md
- Maintainer: eric <yourEmail@email.com>
-    Created: 2022-06-28
- LastChange: 2022-06-28
-    Version: v0.0.01

https://kxcblog.com/post/terminal/2.tmux-tutorial
# tmux默认快捷键的前缀是 ctrl-b, 我修改成了 ` (数字键1左边的那个键)

#shfit + mouse , right -> copy

#Basic
tmux ls  # 查询所有会话
tmux new -s session_name    # 创建会话
tmux detach # 断开会话，或者使用快捷键 <prefix>-d
tmux attach [-t session_name]   # 重新连接会话，-t session_name 指定连接的会话名称
tmux kill-session -t session_name   # 关闭会话，会话关闭后，会话中所有的程序也会关闭

## Session
s   # 列出所有会话
$   # 重命名会话
d   # 断开会话


## Windows
c # 新建窗口
, # 重命名窗口
w   # 列出所有窗口
n # 选择下一个窗口
p # 选择上一个窗口
0-9 # 选择对应编号的窗口

- # 水平分割窗口，默认键为 %
\ # 垂直分割窗口，默认键为 "


## Pane
q # 显示窗格的编号
o # 在窗格间切换
} # 与下一个窗格交换位置
{ # 与上一个窗格交换位置
x # 关闭当前窗格

- # 创建一个水平窗格，默认键为 %
\   # 创建一个竖直窗格，默认键为 "
j # 选择下一个窗格
k # 选择上一个窗格
h # 选择左一个窗格
l # 选择右一个窗格
ctrl-j  # 向下resize窗格
ctrl-k  # 向上resize窗格
ctrl-h  # 向左resize窗格
ctrl-l  # 向右resize窗格

# 历史输出
[ #直接q退出

## Other
# 列出所有快捷键，及其对应的 Tmux 命令
tmux list-keys

# 列出所有 Tmux 命令及其参数
tmux list-commands

# 列出当前所有 Tmux 会话的信息
tmux info

# 重新加载当前的 Tmux 配置
tmux source-file ~/.tmux.conf




#configuration ~/.tmux.conf
```
# tmux默认快捷键的前缀是 ctrl-b, 我修改成了 ` (数字键1左边的那个键)
# Set Ctrl-b key bindings
unbind C-b
set -g prefix `

# 窗口索引从1开始，`-1 即切换到第一个窗口
# Count sessions start at 1
set -g base-index 1

# vi模式，v开始选择，y 复制选择内容到剪贴板
# Use vim bindings
setw -g mode-keys vi
# start selecting text typing 'v' key (once you are in copy mode)
bind-key -T copy-mode-vi 'v' send -X begin-selection
# # copy selected text to the system's clipboard
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel pbcopy

#up
bind-key k select-pane -U
#down
bind-key j select-pane -D
#left
bind-key h select-pane -L
#right
bind-key l select-pane -R

# 切分窗口，快捷键修改为 - 水平切分窗口， \ 垂直切分窗口
# split window
unbind '"'
bind - splitw -v
unbind %
bind \ splitw -h

# ctrl + k/j/h/l 调整pane大小
# resize pane
bind -r ^k resizep -U 10 # upward (prefix Ctrl+k)
bind -r ^j resizep -D 10 # downward (prefix Ctrl+j)
bind -r ^h resizep -L 10 # to the left (prefix Ctrl+h)
bind -r ^l resizep -R 10 # to the right (prefix Ctrl+l)

# Status bar settings
# alignment
set-option -g status-justify centre

# left-bottom corner
set-option -g status-left '#[bg=black,fg=green][#[fg=cyan]#S#[fg=green]]'
set-option -g status-left-length 20

# window list
set-window-option -g window-status-format '#[dim]#I:#[default]#W#[fg=grey,dim]'
set-window-option -g window-status-current-format '#[fg=cyan,bold]#I#[fg=blue]:#[fg=cyan]#W#[fg=dim]'

# right-bottom status
set -g status-right '#[fg=green][#[fg=cyan]%Y-%m-%d#[fg=green]]'

# center window status
set -g window-status-format "#I:#W"
set -g window-status-current-format "#I:#W"

# default statusbar colors
set -g status-fg white
set -g status-bg black

# default window title colors
set-window-option -g window-status-style fg=white
set-window-option -g window-status-style bg=default
set-window-option -g window-status-style dim

# active window title colors
set-window-option -ag window-status-current-style fg=red
set-window-option -ag window-status-current-style bg=default
set-window-option -ag window-status-current-style bold

# command/message line colors
set -g message-style fg=white
set -g message-style bg=black
set -g message-style bright

set -g status-keys vi
bind-key -T vi-edit Up send -X history-up
bind-key -T vi-edit Down send -X history-down

set -g status-interval 1
set -g status-justify centre # center align window list

# window-name
set-option -g allow-rename off
```
