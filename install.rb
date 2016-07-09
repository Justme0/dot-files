#!/usr/bin/env ruby

conf2dir = {
  ".gemrc" => "~",
  ".emacs" => "~",
  ".tmux.conf" => "~",
  ".vimrc" => "~",
  "zathurarc" => "~/.config/zathura/",
  "config.fish" => "~/.config/fish/",
}

conf2dir.each_pair do |target, dst|
  `mkdir -p #{dst}`
  `ln -s ~/dot-files/#{target} #{dst}` # OPTIMIZE: refactor hard code
  puts "ln -s ~/dot-files/#{target} #{dst}" if $?.success?
end
