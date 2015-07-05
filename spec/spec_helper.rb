require "test/unit"
#require "test/unit/spec"

require_relative "../lib/test/unit/doctest"

FILE = File.expand_path("../calculator.rb", __FILE__)
SOURCE = File.read(FILE)

require FILE
