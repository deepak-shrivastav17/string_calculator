# frozen_string_literal: true

class Calculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # Check for custom delimiter
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers_part = numbers[4..-1]  # Skip //;\n
    else
      delimiter = ","
      numbers_part = numbers
    end

    # Convert string to array of integers
    nums = numbers_part.gsub("\n", ",").gsub(delimiter, ",").split(",").map(&:to_i)
    
    # Check for negative numbers
    negatives = nums.select { |n| n < 0 }
    if negatives.any?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
    end

    nums.sum
  end
end
