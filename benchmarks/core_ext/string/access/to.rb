require_relative '../../../benchmark.rb'

require 'active_support/core_ext/string/access'
require 'fast_activesupport/core_ext/string/access'

string  = ('a'..'z').to_a.join()
more_to = string.length + 1
less_to = string.length - 1

FastActiveSupportBenchmark.ips('String#to with argument more than string length') do |b|
  b.report('fast to') do
    string.fast_to(more_to)
  end

  b.report('original to') do
    string.to(more_to)
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#to with argument less than string length') do |b|
  b.report('fast to') do
    string.fast_to(less_to)
  end

  b.report('original to') do
    string.to(less_to)
  end

  b.compare!
end
