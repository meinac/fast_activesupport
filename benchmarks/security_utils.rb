require_relative 'benchmark.rb'

require 'active_support/security_utils'

FastActiveSupportBenchmark.ips('fixed_length_secure_compare') do |b|
  b.report('fast fixed length') do
    ActiveSupport::SecurityUtils.fast_fixed_length_secure_compare('foo', 'foo')
  end

  b.report('original fixed length') do
    ActiveSupport::SecurityUtils.fixed_length_secure_compare('foo', 'foo')
  end

  b.compare!
end

FastActiveSupportBenchmark.ips('secure_compare') do |b|
  b.report('fast fixed length') do
    ActiveSupport::SecurityUtils.fast_secure_compare('foo', 'foo')
  end

  b.report('original fixed length') do
    ActiveSupport::SecurityUtils.secure_compare('foo', 'foo')
  end

  b.compare!
end
