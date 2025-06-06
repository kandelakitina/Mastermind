# frozen_string_literal: true

require 'colorize'
require_relative 'board'

class HumanPlayer
  def provide_code
    puts 'Enter a 4-color code.'
    Board.show_available_colors
    input_code
  end

  def make_guess
    puts 'Enter your guess:'
    Board.show_available_colors
    input_code
  end

  private

  def input_code
    loop do
      input = gets.chomp.downcase.strip.split
      symbols = input.map(&:to_sym)

      return symbols if input.size == 4 && symbols.all? { |c| Board.valid_color?(c) }

      puts 'Invalid input. Enter 4 valid colors separated by spaces.'
    end
  end
end
