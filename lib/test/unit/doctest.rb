require "test/unit/doctest/parser"
require "test/unit/doctest/runner"
require "test/unit/doctest/version"

module Test::Unit
  module Doctest
    def self.run(files, require_file=true)
      Array(files).each { |file| Runner.new(file).run(require_file) }
    end
  end
end
