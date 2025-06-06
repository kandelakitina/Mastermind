# frozen_string_literal: true

class AIPlayer
  COLORS = Board::COLORS

  def provide_code
    COLORS.sample(4)
  end

  def make_guess
    COLORS.sample(4)
  end
end
