#!/usr/bin/env ruby

dir = ARGV.empty? ? "." : ARGV.first
system("du -sch #{dir}/$(ls -A #{dir}) | sort -h")
