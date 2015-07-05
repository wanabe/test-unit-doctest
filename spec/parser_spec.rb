require_relative "spec_helper"

class Test::Unit::Doctest::ParserTest < Test::Unit::TestCase
  setup do
    @parser = Test::Unit::Doctest::Parser.new(SOURCE)
    @blocks = @parser.blocks
  end

  test "find the doctest comment blocks" do
    assert_equal 2, @blocks.size
    assert_equal 4, @blocks[0].lines.size
    assert_equal 2, @blocks[1].lines.size
  end

  test "create expression and assertion lines from blocks" do
    lines = @blocks.map { |block| @parser.test_lines(block) }
    assert_equal "_ = Calculator.add(1, 2)", lines[0][0]
    assert_equal "assert_equal(3, _)", lines[0][1]
    assert_equal "_ = Calculator.add(1, 10, 100, 1000)", lines[0][2]
    assert_equal "assert_equal(1111, _)", lines[0][3]
    assert_equal "_ = Calculator.add(:a, 42)", lines[1][0]
    assert_equal "assert_equal(nil, _)", lines[1][1]
  end

  test "create test string from lines" do
    test = @parser.test_string(@parser.test_lines(@blocks[1]), 1)
    assert_match /\s*def test_1$\s*_ = Calculator.add\(:a, 42\)$\s*assert_equal\(nil, _\)$\s*end/, test
  end
end
