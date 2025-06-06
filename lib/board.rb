# frozen_string_literal: true

require 'colorize'
require 'pry-byebug'

class Board
  MAX_ATTEMPTS = 10
  COLORS = %i[red green yellow blue magenta cyan].freeze

  def self.show_available_colors
    print 'Available colors are: '
    COLORS.each do |color|
      print "#{color.to_s.colorize(color)} "
    end
    puts
  end

  def initialize
    @guesses = []       # Array of arrays: [[color1, color2, color3, color4], ...]
    @feedbacks = []     # Array of arrays: [[black, white, empty, empty], ...]
  end

  def add_turn(guess, feedback)
    @guesses << guess
    @feedbacks << feedback
  end

  def display
    puts "\n"
    puts ' MASTERMIND BOARD '.center(40, '=')
    puts "\n"

    (0...MAX_ATTEMPTS).each do |i|
      guess = @guesses[i] || Array.new(4, nil)
      # binding.pry
      feedback = @feedbacks[i] || Array.new(4, :empty)

      guess_str = guess.map { |color| render_color(color) }.join(' ')
      feedback_str = feedback.map { |peg| render_feedback(peg) }.join(' ')
      puts "#{guess_str} | #{feedback_str}"
    end

    puts "\n"
    puts '=' * 40
    puts "\n"
  end

  private

  def render_color(color)
    return '0'.colorize(:light_black) unless color

    '0'.colorize(color)
  end

  def render_feedback(peg)
    case peg
    when :black
      'x'.colorize(:red)
    when :white
      'x'.colorize(:white)
    else
      'x'.colorize(:light_black)
    end
  end
end
