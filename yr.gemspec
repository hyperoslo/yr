# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yr/version'

Gem::Specification.new do |spec|
  spec.name          = "yr"
  spec.version       = Yr::VERSION
  spec.authors       = ["Espen Høgbakk"]
  spec.email         = ["espen@hogbakk.no"]
  spec.description   = "Yr makes it easy to get weather forecast from Yr.no."
  spec.summary       = "Yr makes it easy to get weather forecast from Yr.no."
  spec.homepage      = "http://github.com/hyperoslo/yr"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-its"
end
