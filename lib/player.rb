# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'game.rb'

class Player
  attr_reader :human
  def initialize(player, dificulty = nil)
    @human = player
    @dificulty = dificulty
  end
end
