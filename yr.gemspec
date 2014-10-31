# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yr/version'

Gem::Specification.new do |s|
  s.name          = "yr"
  s.version       = Yr::VERSION
  s.authors       = ["Espen Høgbakk"]
  s.email         = ["espen@hogbakk.no"]
  s.description   = "Yr makes it easy to get weather forecast from Yr.no."
  s.summary       = "Yr makes it easy to get weather forecast from Yr.no."
  s.homepage      = "http://github.com/hyperoslo/yr"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", "~> 4.0"
  s.add_dependency "nokogiri", "~> 1.6"

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "factory_girl", "~> 4.0"
end
