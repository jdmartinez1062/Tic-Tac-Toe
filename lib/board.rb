# frozen_string_literal: true

require_relative 'game.rb'
require_relative 'player.rb'

class Board
  attr_accessor :a1, :a2, :a3,
                :b1, :b2, :b3,
                :c1, :c2, :c3, :key

  def initialize
    @turn = ['player']
    @key = {
      a1: '-', a2: '-', a3: '-',
      b1: '-', b2: '-', b3: '-',
      c1: '-', c2: '-', c3: '-'
    }
    @gaming = true
  end

  def print_board(outputter)
    board_array = ["| ################################## |\n" * 3,
                   '',
                   '| ########     | 1 | 2 | 3 |',
                   "| ########   a | #{key[:a1]} | #{key[:a2]} | #{key[:a3]} |",
                   "| ########   b | #{key[:b1]} | #{key[:b2]} | #{key[:b3]} |",
                   "| ########   c | #{key[:c1]} | #{key[:c2]} | #{key[:c3]} |",
                   '',
                   "| ################################## |\n" * 3,
                   '']

    board_array.each { |x| outputter.call(x) }
  end

  def somebody_win?
    return 'x' if (key[:a1] == 'x') && (key[:a2] == 'x') && (key[:a3] == 'x')
    return 'x' if (key[:b1] == 'x') && (key[:b2] == 'x') && (key[:b3] == 'x')
    return 'x' if (key[:c1] == 'x') && (key[:c2] == 'x') && (key[:c3] == 'x')
    return 'x' if (key[:a1] == 'x') && (key[:b2] == 'x') && (key[:c3] == 'x')
    return 'x' if (key[:c1] == 'x') && (key[:b2] == 'x') && (key[:a3] == 'x')
    return 'x' if (key[:a1] == 'x') && (key[:b1] == 'x') && (key[:c1] == 'x')
    return 'x' if (key[:b2] == 'x') && (key[:a2] == 'x') && (key[:c2] == 'x')
    return 'x' if (key[:c3] == 'x') && (key[:b3] == 'x') && (key[:a3] == 'x')
    return 'o' if (key[:a1] == 'o') && (key[:a2] == 'o') && (key[:a3] == 'o')
    return 'o' if (key[:b1] == 'o') && (key[:b2] == 'o') && (key[:b3] == 'o')
    return 'o' if (key[:c1] == 'o') && (key[:c2] == 'o') && (key[:c3] == 'o')
    return 'o' if (key[:a1] == 'o') && (key[:b2] == 'o') && (key[:c3] == 'o')
    return 'o' if (key[:c1] == 'o') && (key[:b2] == 'o') && (key[:a3] == 'o')
    return 'o' if (key[:a1] == 'o') && (key[:b1] == 'o') && (key[:c1] == 'o')
    return 'o' if (key[:b2] == 'o') && (key[:a2] == 'o') && (key[:c2] == 'o')
    return 'o' if (key[:c3] == 'o') && (key[:b3] == 'o') && (key[:a3] == 'o')

    false
  end
end
