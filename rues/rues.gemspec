# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rues/version'

Gem::Specification.new do |spec|
  spec.name          = "rues"
  spec.version       = Rues::VERSION
  spec.authors       = ["Kim, Hirokuni"]
  spec.email         = ["hirokuni.kim@kvh.co.jp"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "awesome_print"

  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'net-ssh'
  spec.add_runtime_dependency 'net-scp'

end
