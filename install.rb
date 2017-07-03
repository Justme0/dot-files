#!/usr/bin/env ruby

conf2dir = {
  ".gemrc"      => "~",
  ".emacs"      => "~",
  ".tmux.conf"  => "~",
  ".vimrc"      => "~",
  "zathurarc"   => "~/.config/zathura/",
  "config.fish" => "~/.config/fish/",
  "keyboard"    => "/etc/default/",
}

conf2dir.each_pair do |target, dir|
  `mkdir -p #{dir}`
  cmd = "sudo ln -fs ~/dot-files/#{target} #{dir}"
  puts cmd
  system(cmd) # OPTIMIZE: refactor hard code
end
