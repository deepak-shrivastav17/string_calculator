require "test_helper"
require_relative "../../app/services/string_calculator"

class CalculatorTest < ActiveSupport::TestCase
  test "empty string returns 0" do
    assert_equal 0, Calculator.add("")
  end

  test "single number returns that number" do
    assert_equal 1, Calculator.add("1")
  end
end
