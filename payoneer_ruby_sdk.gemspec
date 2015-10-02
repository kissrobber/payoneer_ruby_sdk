# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payoneer/version'

Gem::Specification.new do |spec|
  spec.name          = "payoneer_ruby_sdk"
  spec.version       = Payoneer::VERSION
  spec.authors       = ["kissrobber"]
  spec.email         = ["kissrobber@gmail.com"]
  spec.summary       = %q{Payoneer Ruby SDK}
  spec.description   = %q{Payoneer Ruby SDK}
  spec.homepage      = "https://github.com/kissrobber/payoneer_ruby_sdk"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"

end
