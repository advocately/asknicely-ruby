# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asknicely/version'

Gem::Specification.new do |spec|
  spec.name          = "asknicely"
  spec.version       = Asknicely::VERSION
  spec.authors       = ["Lachlan Priest"]
  spec.email         = ["lachlan@advocate.ly"]

  spec.summary       = "Micro gem for Asknicely API"
  spec.description   = "Micro gem for Asknicely API to pull NPS results"
  spec.homepage      = "https://github.com/advocately/asknicely-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]


  spec.add_dependency "multi_json"
  spec.add_development_dependency "bundler", "~> 1.17.1"
  spec.add_development_dependency "rake", "12.3.2"
  spec.add_development_dependency "minitest", "~> 5.0"
end
