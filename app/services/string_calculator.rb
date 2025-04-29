# frozen_string_literal: true

class Calculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers_part = extract_delimiter_and_numbers(numbers)
    nums = parse_numbers(numbers_part, delimiter)
    validate_no_negatives(nums)
    
    nums.sum
  end

  private

  def self.extract_delimiter_and_numbers(input)
    if input.start_with?("//")
      [input[2], input[4..-1]]  # [delimiter, numbers_part]
    else
      [",", input]
    end
  end

  def self.parse_numbers(numbers_part, delimiter)
    numbers_part.gsub("\n", ",")
                .gsub(delimiter, ",")
                .split(",")
                .map(&:to_i)
  end

  def self.validate_no_negatives(numbers)
    negatives = numbers.select { |n| n < 0 }
    if negatives.any?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
    end
  end
end
