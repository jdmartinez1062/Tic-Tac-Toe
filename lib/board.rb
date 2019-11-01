# frozen_string_literal: true

require_relative 'game.rb'
require_relative 'player.rb'
# Board class holds the empty and taken positions and checks for a winner
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
    dictionary = {
      d2: [key[:b1], key[:b2], key[:b3]],
      d1: [key[:a1], key[:a2], key[:a3]],
      d3: [key[:c1], key[:c2], key[:c3]],
      d4: [key[:a1], key[:b2], key[:c3]],
      d5: [key[:c1], key[:b2], key[:a3]],
      d6: [key[:a1], key[:b1], key[:c1]],
      d7: [key[:b2], key[:a2], key[:c2]],
      d8: [key[:c3], key[:b3], key[:a3]]
    }
    dictionary.values.each do |v|
      return 'x' if v.all?('x')
      return '0' if v.all?('0')
    end
    false
  end
end
