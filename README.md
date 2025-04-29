# String Calculator TDD Kata

This is my implementation of the String Calculator TDD Kata. The kata focuses on practicing Test-Driven Development by implementing a simple string calculator that follows specific rules.

## Requirements

- Ruby 3.2.2
- Rails 8.0.2

## Setup

1. Clone the repository
2. Run `bundle install`
3. Run `rails test` to execute the test suite

## Development Process

I'm following strict TDD principles:
1. Write a failing test (Red)
2. Write the minimum code to make the test pass (Green)
3. Refactor the code while keeping the tests green

## Test Cases

- Empty string returns 0
- Single number returns that number
- Two numbers separated by comma returns their sum
- Handle new lines between numbers
- Support different delimiters
- Negative numbers throw an exception
