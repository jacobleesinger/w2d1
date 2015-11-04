class Bishop < Piece

  def to_s
    "[B]"
  end

  def possible_moves
    self.diagonal_moves
  end
end
