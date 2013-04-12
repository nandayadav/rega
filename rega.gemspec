# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rega/version'

Gem::Specification.new do |spec|
  spec.name          = "rega"
  spec.version       = Rega::VERSION
  spec.authors       = ["Nanda Yadav"]
  spec.email         = ["nandayadav@gmail.com"]
  spec.description   = %q{TODO: Generate JSON responses for Vega}
  spec.summary       = %q{TODO: This library provides simple Wrapper for generatin JSON that's consumed by VEGA(visualization grammar based on d3.js)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
