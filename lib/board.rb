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

  def print_board (outputter)
     board_array=["| ################################## |\n"*3,
     '',
     '| ########     | 1 | 2 | 3 |',
     "| ########   a | #{@key[:a1]} | #{@key[:a2]} | #{@key[:a3]} |",
     "| ########   b | #{@key[:b1]} | #{@key[:b2]} | #{@key[:b3]} |",
     "| ########   c | #{@key[:c1]} | #{@key[:c2]} | #{@key[:c3]} |",
     '',
     "| ################################## |\n"*3,
     '']

      board_array.each{|x| outputter.call(x)}
  end

  def somebody_win?(_move)
    if (@board[:a1] == 'x') && (@board[:a2] == 'x') && (@board[:a3] == 'x')
      return 'x'
    end
    if (@board[:b1] == 'x') && (@board[:b2] == 'x') && (@board[:b3] == 'x')
      return 'x'
    end
    if (@board[:c1] == 'x') && (@board[:c2] == 'x') && (@board[:c3] == 'x')
      return 'x'
    end
    if (@board[:a1] == 'x') && (@board[:b2] == 'x') && (@board[:c3] == 'x')
      return 'x'
    end
    if (@board[:c1] == 'x') && (@board[:b2] == 'x') && (@board[:a3] == 'x')
      return 'x'
    end
    if (@board[:a1] == 'x') && (@board[:b1] == 'x') && (@board[:c1] == 'x')
      return 'x'
    end
    if (@board[:b2] == 'x') && (@board[:a2] == 'x') && (@board[:c2] == 'x')
      return 'x'
    end
    if (@board[:c3] == 'x') && (@board[:b3] == 'x') && (@board[:a3] == 'x')
      return 'x'
    end

    ​
    if (@board[:a1] == 'o') && (@board[:a2] == 'o') && (@board[:a3] == 'o')
      return 'o'
    end
    if (@board[:b1] == 'o') && (@board[:b2] == 'o') && (@board[:b3] == 'o')
      return 'o'
    end
    if (@board[:c1] == 'o') && (@board[:c2] == 'o') && (@board[:c3] == 'o')
      return 'o'
    end
    if (@board[:a1] == 'o') && (@board[:b2] == 'o') && (@board[:c3] == 'o')
      return 'o'
    end
    if (@board[:c1] == 'o') && (@board[:b2] == 'o') && (@board[:a3] == 'o')
      return 'o'
    end
    if (@board[:a1] == 'o') && (@board[:b1] == 'o') && (@board[:c1] == 'o')
      return 'o'
    end
    if (@board[:b2] == 'o') && (@board[:a2] == 'o') && (@board[:c2] == 'o')
      return 'o'
    end
    if (@board[:c3] == 'o') && (@board[:b3] == 'o') && (@board[:a3] == 'o')
      return 'o'
    end

    false
  end
end
