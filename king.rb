class King < Piece
    def to_s
      "[K]"
    end

  def basic_moves
    # puts "in the king's basic moves"
    # king cannot move into danger! implement later using #check?
    moves = []
    moves += straight_moves
    moves += diagonal_moves
    moves.select do |x, y|
      (@position[0] - x).abs == 1 || (@position[1] - y).abs == 1
    end
  end

  def possible_moves
    # puts "in the king's possible moves"
    moves = basic_moves
    # puts "finished the king's basic moves"
    # puts "basic moves are #{basic_moves}"
    moves.select! do |move|
      # puts "in the select. move is #{move}"
      enemy_moves.include?(move)
      puts "past enemy moves"
    end
    puts "finished the select"
    moves
  end

  def enemy_moves
    puts "in King#enemy moves"
    enemy_pieces = @board.grid.flatten.select do |piece|
      # puts "in enemy pieces"
      piece if piece && piece.team != self.team
    end
    puts "past the select"

    moves = []
    enemy_pieces.each do |piece|
      # puts "in the each"
      moves += piece.possible_moves
      # puts "past possible_moves"
    end
    puts "past the each"
    moves
  end

end
