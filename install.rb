#!/usr/bin/env ruby

conf2dir = {
  ".gemrc" => "~",
  ".emacs" => "~",
  ".tmux.conf" => "~",
  ".vimrc" => "~",
  "zathurarc" => "~/.config/zathura/",
  "config.fish" => "~/.config/fish/",
}

conf2dir.each_pair do |target, dir|
  `mkdir -p #{dir}`
  cmd = "ln -s ~/dot-files/#{target} #{dir}"
  puts cmd
  system(cmd) # OPTIMIZE: refactor hard code
end
