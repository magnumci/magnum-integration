# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'magnum/integration/version'

Gem::Specification.new do |spec|
  spec.name          = "magnum-integration"
  spec.version       = Magnum::Integration::VERSION
  spec.authors       = ["Dan Sosedoff"]
  spec.email         = ["dan.sosedoff@gmail.com"]
  spec.description   = %q{Integrate with source code providers}
  spec.summary       = %q{Integrate with source code providers}
  spec.homepage      = "https://github.com/magnumci/magnum-integration"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "octokit", "~> 2.0"
  spec.add_dependency "gitlab", ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "simplecov", "~> 0.7"
  spec.add_development_dependency "json", "~> 1.8"
end
