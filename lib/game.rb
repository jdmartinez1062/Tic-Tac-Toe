# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'

class Game
  attr_accessor :turn, :board, :gaming
  def initialize(players, dificulty = nil)
    @turn = :p1
    @board = Board.new
    case players
    when '2'
      @players = { p1: Player.new(true),
                   p2: Player.new(true) }
    when '1'
      @players = { p1: Player.new(true),
                   p2: Player.new(false, dificulty) }
    else
      false
    end
    @gaming = true
  end

  def human_turn()

  end
  def computer_turn

  end


  def playergame_1(outputter,inputer)
    
    self.board.print_board(outputter)
    while self.gaming
      if self.turn == :p1
  
        ['', "| It's Your turn Human, tell me your move |",
        "|     Or enter: 'end' for leaving         |", ''].each{|x| outputter.call(x)}
        move = inputer.call
        if move == 'end'
          self.gaming = false
        elsif self.board.key.include? move.to_sym
          unless self.board.key[move.to_sym] == '-'
            outputter.call('|       That position is taken        |')
            next
          end
          self.board.key[move.to_sym] = 'x'
          self.turn = :p2
          system('cls')
          outputter.call("| You just played #{move}")
          self.board.print_board(outputter)
          outputter.call('|           PRESS ANY ENTER             |')
          inputer.call
  
        else
          outputter.call("| I don't know what you're saying, repeat please")
        end
  
      elsif self.turn == :p2
  
        getting_computer_move = true
        while getting_computer_move
          move = self.board.key.keys.sample
          next unless self.board.key[move.to_sym] == '-'
  
          self.board.key[move.to_sym] = '0'
          system('cls')
          ['',
          "| It's MY turn Human, prepare for this: |",
          "| I just played #{move}",
          ''].each{|x| outputter.call(x)}

          self.board.print_board(outputter)
          outputter.call('|           PRESS ANY ENTER             |')
          inputer.call
          self.turn = :p1
          getting_computer_move = false
        end
      end
    end
  end

  def playergame_2(outputter,inputer)
    self.board.print_board(outputter)
    while self.gaming
      if self.turn == :p1
  
        ['', "| It's Your turn Player One, tell me your move |",
        "|     Or enter: 'end' for leaving         |", ''].each{|x| outputter.call(x)}
        move = inputer.call
        if move == 'end'
          self.gaming = false
        elsif self.board.key.include? move.to_sym
          unless self.board.key[move.to_sym] == '-'
            outputter.call('|       That position is taken        |')
            next
          end
          self.board.key[move.to_sym] = 'x'
          self.turn = :p2
          system('cls')
          outputter.call("| You just played #{move}")
          self.board.print_board(outputter)
          outputter.call('|           PRESS ANY ENTER             |')
          inputer.call
  
        else
          outputter.call("| I don't know what you're saying, repeat please")
        end
  
      elsif self.turn == :p2
  
        ['',
        "| It's Your turn player 2, tell me your move |",
        "|     Or enter: 'end' to surrender      |",
        ''].each { |x| outputter.call(x)}
        move = inputer.call
        if move == 'end'
          self.gaming = false
        elsif self.board.key.include?(move.to_sym)
          unless self.board.key[move.to_sym] == '-'
            outputter.call('|       That position is taken        |')
            next
          end
          self.board.key[move.to_sym] = '0'
          self.turn = :p1
          system('cls')
          outputter.call("| You just played #{move}")
          self.board.print_board(outputter)
          outputter.call('|           PRESS ANY ENTER             |')
          inputer.call
  
        else
          outputter.call("| I don't know what you're saying, repeat please")
        end
      end
    end
  end
  

end
