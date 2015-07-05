require "test/unit"

module Test::Unit
  module Doctest
    class Runner
      attr_reader :test_class, :test_strings

      def initialize(file)
        @file = file
        @test_class = Class.new(Test::Unit::TestCase)
        @test_class.define_singleton_method(:to_s) { file }
        @test_strings = Parser.new(File.read(file)).parse
      end

      def run(require_file)
        define_tests
        require File.absolute_path(@file) if require_file
      end

      def define_tests
        @test_strings.each { |str| @test_class.class_eval(str) }
      end
    end
  end
end
