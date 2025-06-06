# frozen_string_literal: true

require_relative 'board'
require_relative 'human_player'
require_relative 'ai_player'
require 'pry-byebug'

class GameController
  def initialize
    choose_roles
    @board = Board.new
  end

  def choose_roles
    choice = nil

    loop do
      puts 'Do you want to be the code (1)maker or (2)breaker?'
      print 'Enter 1 or 2: '
      input = gets.chomp.strip

      if input == '1'
        choice = :maker
        break
      elsif input == '2'
        choice = :breaker
        break
      else
        puts 'Invalid choice. Please enter 1 or 2.'
      end
    end

    assign_roles(choice)
  end

  def assign_roles(choice)
    if choice == :maker
      @code_maker = HumanPlayer.new
      @code_breaker = AIPlayer.new
    else
      @code_maker = AIPlayer.new
      @code_breaker = HumanPlayer.new
    end
  end

  def play
    secret_code = @code_maker.provide_code
    puts "\nThe code has been set. Let's begin!".center(40, '-')

    Board::MAX_ATTEMPTS.times do |turn|
      puts "\nTurn #{turn + 1} of #{Board::MAX_ATTEMPTS}"
      guess = @code_breaker.make_guess
      feedback = evaluate_guess(guess, secret_code)

      @board.add_turn(guess, feedback)
      @board.display
      # binding.pry

      if feedback.count(:black) == 4
        puts "\n#{@code_breaker.class} guessed the code in #{turn + 1} turns!"
        return
      end
    end

    puts "\nOut of turns! The secret code was:"
    puts secret_code.map { |c| '0'.colorize(c) }.join(' ')
  end

  def evaluate_guess(guess, code)
    feedback = []
    code_copy = code.dup
    guess_copy = guess.dup

    # First pass: Check for exact matches (black pegs)
    guess.each_with_index do |peg, idx|
      next unless peg == code[idx]

      feedback << :black
      guess_copy[idx] = nil
      code_copy[idx] = nil
    end

    # Second pass: Check for correct color, wrong position (white pegs)
    guess_copy.each_with_index do |peg, idx|
      next if peg.nil?

      match_idx = code_copy.index(peg)
      next unless match_idx

      feedback << :white
      code_copy[match_idx] = nil
      guess_copy[idx] = nil
    end

    # Fill the rest with :empty to always return 4 elements
    feedback.fill(:empty, feedback.size...4)

    feedback.shuffle
  end
end
