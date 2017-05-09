# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex/predictor/version'

Gem::Specification.new do |spec|
  spec.name          = "yandex_predictor"
  spec.version       = Yandex::Predictor::VERSION
  spec.authors       = ["Vladislav Dyachenko"]
  spec.email         = ["vla-dy@yandex.ru"]

  spec.summary       = %q{Yandex Predictor API}
  spec.description   = %q{Client for Yandex Predictor Service API.}
  spec.homepage      = "https://github.com/wowinter13/yandex_predictor"
  spec.license       = "MIT"
  spec.files         = Dir.glob("lib/**/*")

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_dependency "httparty"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'webmock'

end
