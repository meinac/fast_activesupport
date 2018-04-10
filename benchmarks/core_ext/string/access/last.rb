require_relative '../../../benchmark.rb'

require 'active_support/core_ext/string/access'
require 'fast_activesupport/core_ext/string/access'

string      = ('a'..'z').to_a.join()
more_length = string.length + 1
less_length = string.length - 1

FastActiveSupportBenchmark.ips('String#last without argument') do |b|
  b.report('fast last') do
    string.fast_last
  end

  b.report('original last') do
    string.last
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#last with argument more than string length') do |b|
  b.report('fast last') do
    string.fast_last(more_length)
  end

  b.report('original last') do
    string.last(more_length)
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#last with argument less than string length') do |b|
  b.report('fast last') do
    string.fast_last(less_length)
  end

  b.report('original last') do
    string.last(less_length)
  end

  b.compare!
end
