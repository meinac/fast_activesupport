require_relative '../../../benchmark.rb'

require 'active_support/core_ext/string/access'
require 'fast_activesupport/core_ext/string/access'

string    = ('a'..'z').to_a.join()
more_from = string.length + 1
less_from = string.length - 1

FastActiveSupportBenchmark.ips('String#from with argument more than string length') do |b|
  b.report('fast from') do
    string.fast_from(more_from)
  end

  b.report('original from') do
    string.from(more_from)
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#from with argument less than string length') do |b|
  b.report('fast from') do
    string.fast_from(less_from)
  end

  b.report('original from') do
    string.from(less_from)
  end

  b.compare!
end
