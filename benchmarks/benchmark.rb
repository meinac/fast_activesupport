ENV['FAST_PREFIX'] = 'fast'
PATH = '../'

begin
  require 'bundler/inline'
rescue LoadError => e
  $stderr.puts 'Bundler version 1.10 or later is required. Please update your Bundler'
  raise e
end

gemfile(true) do
  source 'https://rubygems.org'
  gem 'benchmark-ips'
  gem 'pry'
  gem 'rails', github: 'rails/rails'
  gem 'fast_activesupport', path: PATH
end

require 'fast_activesupport/security_utils'

class FastActiveSupportBenchmark

  class << self
    def ips(name, &block)
      print_name(name)

      Benchmark.ips do |b|
        block.call(b)
      end
    end

    private
      def print_name(name)
        label = "# COMPARING #{name} #"
        puts ''
        puts '#' * label.length
        puts label
        puts '#' * label.length
        puts ''
      end
  end

end
