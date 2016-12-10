#!/usr/bin/env ruby

# e.g. ARGV is ssh, then arg is [s]sh.
arg = "[#{ARGV.first[0]}]#{ARGV.first[1..-1]}"

out = `ps -e | grep -v 'dot-files/fish/p.rb #{ARGV.first}' | grep -i --color=always #{arg}`
if out.empty?
  exit false
else
  puts out
end
