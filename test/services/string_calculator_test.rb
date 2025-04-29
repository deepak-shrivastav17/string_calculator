require "test_helper"
require_relative "../../app/services/string_calculator"

class CalculatorTest < ActiveSupport::TestCase
  test "empty string returns 0" do
    assert_equal 0, Calculator.add("")
  end

  test "single number returns that number" do
    assert_equal 1, Calculator.add("1")
    assert_equal 2, Calculator.add("2")
    assert_equal 42, Calculator.add("42")
  end

  test "two numbers returns their sum" do
    assert_equal 3, Calculator.add("1,2")
    assert_equal 10, Calculator.add("3,7")
    assert_equal 42, Calculator.add("40,2")
  end

  test "handles unknown amount of numbers" do
    assert_equal 6, Calculator.add("1,2,3")
    assert_equal 15, Calculator.add("1,2,3,4,5")
    assert_equal 45, Calculator.add("1,2,3,4,5,6,7,8,9")
  end

  test "handles new lines between numbers" do
    assert_equal 6, Calculator.add("1\n2,3")
    assert_equal 10, Calculator.add("1,2\n3,4")
    assert_equal 15, Calculator.add("1\n2\n3,4,5")
  end

  test "supports custom delimiters" do
    assert_equal 3, Calculator.add("//;\n1;2")
    assert_equal 6, Calculator.add("//|\n1|2|3")
    assert_equal 10, Calculator.add("//@\n2@3@5")
  end

  test "throws exception for negative numbers" do
    exception = assert_raises(ArgumentError) do
      Calculator.add("-1,2")
    end
    assert_equal "negative numbers not allowed: -1", exception.message

    exception = assert_raises(ArgumentError) do
      Calculator.add("1,-2,3,-4")
    end
    assert_equal "negative numbers not allowed: -2, -4", exception.message
  end
end
