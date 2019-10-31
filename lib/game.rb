# frozen_string_literal: true
require_relative 'board.rb'
require_relative 'player.rb'

class Game
  
  attr_accessor :turn, :board, :gaming
  def initialize (players, dificulty = nil)
    @turn = :p1
    @board = Board.new
    case players
    when '2'
    @players ={ p1: Player.new(true),
                p2: Player.new(true)}
    when '1'
      @players ={ p1: Player.new(true),
        p2: Player.new(false,dificulty)}
    else
      false
    end
    @gaming = true
  end



end



