# frozen_string_literal: true
require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'main.rb'

class Board
  attr_writer :a1, :a2, :a3,
              :b1, :b2, :b3,
              :c1, :c2, :c3

  def initialize
    @turn = ['player']
    @board = {
      a1: '-', a2: '-', a3: '-',
      b1: '-', b2: '-', b3: '-',
      c1: '-', c2: '-', c3: '-'
    }
    @gaming = true
  end

  def print_board
    puts '| ################################## |'
    puts '| ################################## |'
    puts '| ################################## |'
    puts ''
    puts '  | 1 | 2 | 3 |'
    puts "a | #{@board[:a1]} | #{@board[:a2]} | #{@board[:a3]} |"
    puts "b | #{@board[:b1]} | #{@board[:b2]} | #{@board[:b3]} |"
    puts "c | #{@board[:c1]} | #{@board[:c2]} | #{@board[:c3]} |"
    puts ''
    puts '| ################################## |'
    puts '| ################################## |'
    puts '| ################################## |'
    puts ''
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