
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'display.rb'

class Game
  attr_accessor :player1, :player2, :board
  def initialize
    @board = Board.new
    @player1 = Player.new(@board, :team1)
    @player2 = Player.new(@board, :team2)
    @board.set_teams
    @display = Display.new(@board.grid)
  end

  def play
    take_turn until game_over?
    return winner
  end

  def take_turn
    display.move_cursor
    #ask for a move
    #check if move is valid
    #perfom the move if valid
    #switch players
  end

  def game_over?

  end

end
