class King < Piece
    def to_s
      "[K]"
    end

  def basic_moves
    # king cannot move into danger! implement later using #check?
    moves = []
    moves += straight_moves
    moves += diagonal_moves
    moves.select do |x, y|
      (@position[0] - x).abs == 1 || (@position[1] - y).abs == 1
    end
  end

  def possible_moves
    moves = basic_moves
    moves.select! { |move| enemy_moves.include?(move) }
    moves
  end

  def enemy_moves
    enemy_pieces = @board.grid.flatten.select do |piece|
      piece if piece && piece.team != self.team
    end

    moves = []
    enemy_pieces.each do |piece|
      moves += piece.possible_moves
    end
    moves
  end

end
