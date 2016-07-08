#!/usr/bin/env ruby

conf2dir = {
  "config.fish" => "~/.config/fish/",
  ".emacs" => "~",
  ".tmux.conf" => "~",
  ".vimrc" => "~",
  "zathurarc" => "~/.config/zathura/",
}

conf2dir.each_pair do |target, dst|
  `mkdir -p #{dst}`
  `ln -s ~/dot-files/#{target} #{dst}` # OPTIMIZE: refactor hard code
  puts "ln -s ~/dot-files/#{target} #{dst}" if $?.success?
end
