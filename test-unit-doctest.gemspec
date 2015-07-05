# encoding: utf-8
$: << File.expand_path("../lib", __FILE__)
require "test/unit/doctest/version"

Gem::Specification.new do |gem|
  gem.name          = "test-unit-doctest"
  gem.version       = Test::Unit::Doctest::VERSION
  gem.email         = ["s.wanabe@gmail.com"]
  gem.authors       = gem.email
  gem.description   = "Generate tests from code comments"
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/wanabe/test-unit-doctest"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "test-unit", "~> 3.1"
end
