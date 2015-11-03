class Piece
  attr_accessor :token, :position, :team, :board
  def initialize(position, board)
    @position = position
    @board = board
  end

  def to_s
    token
  end

  def move(end_pos)
    if valid_move(end_pos)
      @position = end_pos
    end
  end

  def valid_move?(pos)
    x, y = pos

    return false unless on_board?(pos)
    return true if @board.grid[x][y].nil?
    return false if @board.grid[x][y].team == self.team
  end

  def on_board?(pos)
    x, y = pos
    return false unless x.between?(0, 7) && y.between?(0, 7)
    true
  end



end
