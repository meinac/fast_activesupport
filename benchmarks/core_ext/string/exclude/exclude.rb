require_relative '../../../benchmark.rb'

require 'active_support/core_ext/string/exclude'
require 'fast_activesupport/core_ext/string/exclude'

string         = ('a'..'z').to_a.join()
not_found_char = '1'
found_char     = 'f'
not_found_str  = 'deff'
found_str      = 'defg'

FastActiveSupportBenchmark.ips('String#exclude? with not found char') do |b|
  b.report('fast exclude?') do
    string.fast_exclude?(not_found_char)
  end

  b.report('original exclude?') do
    string.exclude?(not_found_char)
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#exclude? with found char') do |b|
  b.report('fast exclude?') do
    string.fast_exclude?(found_char)
  end

  b.report('original exclude?') do
    string.exclude?(found_char)
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#exclude? with not found str') do |b|
  b.report('fast exclude?') do
    string.fast_exclude?(not_found_str)
  end

  b.report('original exclude?') do
    string.exclude?(not_found_str)
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('String#exclude? with found str') do |b|
  b.report('fast exclude?') do
    string.fast_exclude?(found_str)
  end

  b.report('original exclude?') do
    string.exclude?(found_str)
  end

  b.compare!
end
