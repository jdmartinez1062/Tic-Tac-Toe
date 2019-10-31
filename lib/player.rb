# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'game.rb'

class Player
  def initialize(player, dificulty = nil)
    @human = player
    @dificulty = dificulty
  end
end
