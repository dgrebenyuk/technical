#!/usr/bin/ruby

require 'benchmark'

puts "Running Ruby #{RUBY_VERSION}"
puts "Benchmarks for array reverse sorting methods"
ary = []
r = Random.new
1000.times {
  ary << r.rand(10000..1000000)
}

n = 500

puts "n=#{n}"
Benchmark.bm(20) do |x|
  x.report("sort reverse")         { n.times { ary.dup.sort.reverse } }
  x.report("sort! reverse!")       { n.times { ary.dup.sort!.reverse! } }
  x.report("sort_by")              { n.times { ary.dup.sort_by{|a| -a} } }
  x.report("sort_by reverse")      { n.times { ary.dup.sort_by{|a| a}.reverse } }
  x.report("sort_by reverse!")     { n.times { ary.dup.sort_by!{|a|a}.reverse! } }
end


puts "Benchmarks for calculation elements sum inside loop"
def variable_sum(array)
  array.sort!.reverse!
  numbers, sum = [], 0
  array.each do |el|
    numbers << el
    sum += el
  end
end

def inject_sum(array)
  array.sort!.reverse!
  numbers = []
  array.each do |el|
    numbers << el
    numbers.inject(:+)
  end
end

Benchmark.bm(20) do |x|
  x.report("Variable sum in loop")   { n.times { variable_sum(ary) } }
  x.report("Inject sum in loop")     { n.times { inject_sum(ary) } }
end

puts "Benchmarks for reverse & each"
def reverse_each(array) # the fastest
  array.sort!.reverse!
  numbers, sum = [], 0
  array.each do |el|
    numbers << el
    sum += el
  end
end

def reverse_with_each(array) # a bit slower (not critical) but looks better.
  numbers, sum = [], 0
  array.sort.reverse.each do |el|
    numbers << el
    sum += el
  end
end

Benchmark.bm(20) do |x|
  x.report("reverse_each")          { n.times { reverse_each(ary) } }
  x.report("reverse_with_each")     { n.times { reverse_with_each(ary) } }
end

# My results
# Running Ruby 2.1.5
# Benchmarks for array reverse sorting methods
# n=500
#                            user     system      total        real
# sort reverse           0.060000   0.000000   0.060000 (  0.058915)
# sort! reverse!         0.060000   0.000000   0.060000 (  0.055498)
# sort_by                0.240000   0.000000   0.240000 (  0.243781)
# sort_by reverse        0.240000   0.000000   0.240000 (  0.241672)
# sort_by reverse!       0.250000   0.000000   0.250000 (  0.241956)


# Benchmarks for calculation elements sum inside loop
#                            user     system      total        real
# Variable sum in loop   0.040000   0.000000   0.040000 (  0.046934)
# Inject sum in loop    12.170000   0.000000  12.170000 ( 12.161397)

# Benchmarks for reverse & each
#                            user     system      total        real
# reverse_each           0.040000   0.000000   0.040000 (  0.043273)
# reverse_with_each      0.050000   0.000000   0.050000 (  0.048471)
