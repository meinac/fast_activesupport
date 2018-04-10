require_relative '../../../benchmark.rb'

require 'active_support/core_ext/string/access'
require 'fast_activesupport/core_ext/string/access'

string      = ('a'..'z').to_a.join()
more_length = string.length + 1
less_length = string.length - 1

FastActiveSupportBenchmark.ips('String#first without argument') do |b|
  b.report('fast first') do
    string.fast_first
  end

  b.report('original first') do
    string.first
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#first with argument more than string length') do |b|
  b.report('fast first') do
    string.fast_first(more_length)
  end

  b.report('original first') do
    string.first(more_length)
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#first with argument less than string length') do |b|
  b.report('fast first') do
    string.fast_first(less_length)
  end

  b.report('original first') do
    string.first(less_length)
  end

  b.compare!
end
