require_relative "spec_helper"

class Test::Unit::Doctest::RunnerTest < Test::Unit::TestCase
  setup do
    @runner = Test::Unit::Doctest::Runner.new(FILE)
  end

  test "define test methods to test class" do
    @runner.define_tests
    test = @runner.test_class.new("test")
    assert_respond_to test, :test_0
    assert_respond_to test, :test_1
  end

  test "return file name with #to_s on test_class" do
    assert_match "calculator.rb", @runner.test_class.to_s
  end
end
