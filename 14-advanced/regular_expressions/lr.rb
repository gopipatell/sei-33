# lr.rb - A Ruby line reader (equivalent to cat)
# Usage: ruby lr.rb somefile.txt

# ARGF is an array of the lines of each file mentioned in ARGV
ARGF.each do |line|
  puts line if line =~ /e/
end
