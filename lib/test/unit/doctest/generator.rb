require "test/unit"

module Test::Unit
  module Doctest
    class Generator
      def initialize(file, class_name)
        @file = file
        @class_name = class_name
        @test_strings = Parser.new(File.read(file)).parse
      end

      def generate
        puts "class #{@class_name} < Test::Unit::TestCase"
        @test_strings.each do |str|
          print "  ", str, "\n"
        end
        puts "end"
      end
    end
  end
end
