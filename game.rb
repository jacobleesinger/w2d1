
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'display.rb'

class Game
  attr_accessor :player1, :player2, :board, :current_player
  def initialize
    @board = Board.new
    @player1 = Player.new(@board, :team1)
    @player2 = Player.new(@board, :team2)
    @board.set_teams
    @display = Display.new(@board)
    @current_player = @player1
  end

  def play
    take_turn until game_over?
    winner
  end


  def switch_players!(player)
    return @player2 if player == @player1
    @player1
  end

  def take_turn
    start_pos = @display.move_cursor
    end_pos = @display.move_cursor
    current_player.move(start_pos, end_pos)
    @current_player = switch_players!(@current_player)
  end

  def game_over?
    return true if @player1.in_checkmate? || @player2.in_checkmate?
    false
  end

  def winner
    return "Player 2 wins!" if @player1.in_checkmate?
    "Player 1 wins!"
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
