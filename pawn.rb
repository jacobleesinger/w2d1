class Pawn < Piece
  attr_reader :token
  def initialize
    @token = "[p]"
  end
end
