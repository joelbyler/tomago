# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tomago/version"

Gem::Specification.new do |spec|
  spec.name          = "tomago"
  spec.version       = Tomago::VERSION
  spec.authors       = ["Joel Byler"]
  spec.email         = ["joelbyler@gmail.com"]
  spec.description   = "Workspace initialization for tmate"
  spec.summary       = "Workspace initialization for tmate."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.20.0"
  spec.add_dependency "colorize", "~> 0.8.1"
  spec.add_dependency "erubis", "~> 2.7"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
