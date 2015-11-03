class Piece
  attr_accessor :token, :position, :team, :board
  def initialize(position)
    @position = position
  end
end
