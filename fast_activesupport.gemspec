
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fast_activesupport/version"

Gem::Specification.new do |spec|
  spec.name          = "fast_activesupport"
  spec.version       = FastActivesupport::VERSION
  spec.authors       = ["Mehmet Emin INAC"]
  spec.email         = ["mehmetemininac@gmail.com"]

  spec.summary       = "Active Support impelemented in C"
  spec.description   = "Active Support impelementation in C for the ones who need for speed."
  spec.homepage      = "https://github.com/meinac/fast_activesupport"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|benchmarks)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "benchmark-ips"
end
