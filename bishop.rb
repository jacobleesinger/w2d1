class Bishop < SlidingPiece
  attr_reader :token
  def initialize
    @token = "[B]"
  end

  def possible_moves
    moves = []
    x, y = @position

  end
end
