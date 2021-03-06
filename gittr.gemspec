# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gittr/version'

Gem::Specification.new do |spec|
  spec.name          = "gittr"
  spec.version       = Gittr::VERSION
  spec.authors       = ["Tyler Ewing"]
  spec.email         = ["tewing10@gmail.com"]
  spec.summary       = %q{Gitter REST API wrapper}
  spec.description   = %q{Gittr is a Ruby wrapper for the Gitter chat client REST API.}
  spec.homepage      = "https://github.com/zoso10/Gittr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0"

  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
