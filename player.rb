class Player
  attr_accessor :pieces, :board, :team
  def initialize(board, team)

    @board = board
    @team = team

  end

  def move(start_pos, end_pos)
    x, y = start_pos
    x2, y2 = end_pos
    fail "no piece at #{start_pos}" unless @board.grid[x][y].team == @team
    unless @board.grid[x][y].possible_moves.include?(end_pos)
      fail "#{start_pos} can't move to #{end_pos}"
    end
    @board.grid[x2][y2] = @board.grid[x][y].dup
    @board.grid[x][y] = nil
    @board.grid[x2][y2].position = [x2, y2]
    @board.grid[x2][y2].has_moved = true
  end

  def get_pieces
    @board.grid.flatten.select do |piece|
       piece if piece && piece.team == self.team
     end
  end

  def enemy_pieces
    @board.grid.flatten.select do |piece|
      piece if piece && piece.team != self.team
    end
  end

  def enemy_moves
    moves = []
    enemy_pieces.each do |piece|
      moves += piece.possible_moves
    end
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
    king = get_pieces.select { |piece| piece.is_a?(King) }
    king.first
  end

  def in_check?
    return true if enemy_moves.include?(king.position)
    false
  end

  def in_checkmate?
    return false unless in_check?
    return false unless king.possible_moves.empty?

    threatening_pieces = enemy_pieces.select do |piece|
      piece.possible_moves.include?(king.position)
    end
    return true if threatening_pieces.size > 1
    enemy = threatening_pieces.first
    return false if get_moves.include?(enemy.position)
    return true if enemy.is_a?(Knight)
    false
    #Doesn't account for being able to block a checkmate.
  end

end
