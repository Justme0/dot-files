#!/usr/bin/env ruby

Dir.chdir(ARGV.first) unless ARGV.empty?

files = ''
files += ' .* ' unless (Dir['.*'] - ['.', '..']).empty?
files += ' * ' unless Dir['*'].empty?

system("fish -c 'du -sch #{files} | sort -h'")

# Ruby is different from fish in expanding '.*'; Ruby includes '.' and '..'
# while fish doesn't.
