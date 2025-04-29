# frozen_string_literal: true

class Calculator
  def self.add(numbers)
    return 0 if numbers.empty?
    
    # Replace newlines with commas and then split
    numbers.gsub("\n", ",").split(",").map(&:to_i).sum
  end
end
