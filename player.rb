class Player
  attr_accessor :pieces, :board, :team
  def initialize(board, team)

    @board = board
    @team = team

  end

  def move(start_pos, end_pos)
    x, y = start_pos
    x2, y2 = end_pos
    unless @board.grid[x][y].team == @team
      fail "no piece at #{start_pos}"
    end
    unless @board.grid[x][y].possible_moves.include?(end_pos)
      fail "#{start_pos} can't move to #{end_pos}"
    end
    @board.grid[x2][y2] = @board.grid[x][y].dup
    @board.grid[x][y] = nil
    @board.grid[x2][y2].position = [x2, y2]
    @board.grid[x2][y2].has_moved = true
    puts "moved piece from #{start_pos} to #{end_pos}"
  end

  def get_pieces
    @board.grid.flatten.select do |piece|
       piece if piece && piece.team == self.team
     end
  end

  def enemy_pieces
    puts "in enemy pieces"
    pieces = @board.grid.flatten.select do |piece|
      # puts "trying to select enemy pieces from all pieces"
      if piece && piece.team != self.team
        # puts "in the if statement"
        piece
      end
      # there is an error here somehow
    end
    # puts "made it out of select"
    pieces
  end

  def enemy_moves
    puts "in enemy_moves"
    moves = []
    enemy_pieces.each do |piece|
      puts "in the each for  #{piece.team} #{piece.to_s} "
      puts "possible moves for #{piece.to_s} are #{piece.possible_moves.inspect}"
      moves += piece.possible_moves
      puts "past possible moves"
    end
    puts "past the each"
    moves
  end

  def get_moves
    moves = []
    get_pieces.each do |piece|
      moves += piece.possible_moves
    end
    moves
  end

  def get_king
    puts "trying to get the king"
    king = get_pieces.select { |piece| piece.is_a?(King) }
    king.first
  end

  def in_check?
    puts "trying to figure out if someone's in check"
    return true if enemy_moves.include?(get_king.position)
    puts "I don't think anyone's in check"
    false
  end

  def in_checkmate?
    puts "trying to figure out if there's a checkmate"
    return false unless in_check?
    "I think someone's in check"   #nope
    return false unless get_king.possible_moves.empty?

    threatening_pieces = enemy_pieces.select do |piece|
      piece.possible_moves.include?(get_king.position)
    end
    return true if threatening_pieces.size > 1
    enemy = threatening_pieces.first
    return false if get_moves.include?(enemy.position)
    return true if enemy.is_a?(Knight)
    false
    #Doesn't account for being able to block a checkmate.
  end

end
