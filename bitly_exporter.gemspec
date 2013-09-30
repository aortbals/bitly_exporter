# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitly_exporter/version'

Gem::Specification.new do |gem|
  gem.name          = "bitly_exporter"
  gem.version       = BitlyExporter::VERSION
  gem.authors       = ["Aaron Ortbals"]
  gem.email         = ["me@aaronortbals.com"]
  gem.description   = %q{Export a user's links from Bitly.}
  gem.summary       = %q{Supports Bitly API V3}
  gem.homepage      = "https://github.com/aortbals/bitly_exporter"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'coveralls'

  gem.add_dependency 'httparty'
end
