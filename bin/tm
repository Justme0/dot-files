#!/usr/bin/env ruby

cmd = `ps aux | grep [t]mux`.count("\n") == 0 ? "tmux" : "tmux attach"
system(cmd)
