class Knight < SteppingPiece

  def to_s
    "[H]"
  end
  def knight_moves
    knight_moves = [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]
    ]
  end

  def possible_moves
    moves = knight_moves.map do |x, y|
      [x + @position[0], y + @position[1]]
    end

    moves.select { |x, y| can_occupy?(x, y) }
  end
end
