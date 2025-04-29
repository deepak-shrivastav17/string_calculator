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

    # Replace newlines and custom delimiter with comma
    numbers_part.gsub("\n", ",").gsub(delimiter, ",").split(",").map(&:to_i).sum
  end
end
