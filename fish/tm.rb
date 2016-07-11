#!/usr/bin/env ruby

`ps aux | grep [t]mux`
$?.success? ? system("tmux attach") : system("tmux")
