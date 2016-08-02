#!/usr/bin/env ruby

Dir.chdir(ARGV.first) unless ARGV.empty?

# Ruby is different from fish when expanding '.*'.
# Ruby includes '.' and '..', but fish doesn't.

files = ''
files += ' .* ' unless (Dir['.*'] - ['.', '..']).empty?
files += ' * ' unless Dir['*'].empty?

system("fish -c 'du -sch #{files} | sort -h'")
