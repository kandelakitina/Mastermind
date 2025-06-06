# frozen_string_literal: true

require 'colorize'

class HumanPlayer
  def provide_code
    puts "Enter a 4-color code."
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
      return input.map(&:to_sym) if input.size == 4 && input.all? { |c| valid_color?(c) }

      puts 'Invalid input. Enter 4 valid colors separated by spaces.'
    end
  end

  def valid_color?(color)
    %w[red blue green yellow orange purple].include?(color)
  end
end
