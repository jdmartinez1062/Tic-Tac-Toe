# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'
# Game class manages logic and creation
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

  def next_player(actual)
    self.turn = if actual == :p1
                  :p2
                else
                  :p1
                end
  end

  def human_turn(outputter, inputer, player)
    move = inputer.call
    if move == 'end'
      self.gaming = false
    elsif board.key.include? move.to_sym
      return outputter.call('|       That position is taken        |') unless board.key[move.to_sym] == '-'

      next_player(turn)
      system('cls') || system('clear')
      outputter.call("| You just played #{move}")
      case player
      when :p1
        return board.key[move.to_sym] = 'x', board.print_board(outputter)
      else
        return board.key[move.to_sym] = '0', board.print_board(outputter)
      end
    else
      outputter.call("| I don't know what you're saying, repeat please")
    end
  end

  def computer_turn(outputter)
    getting_computer_move = true
    while getting_computer_move
      move = board.key.keys.sample
      next unless board.key[move.to_sym] == '-'

      board.key[move.to_sym] = '0'
      system('cls') || system('clear')
      board.print_board(outputter)
      ['',
       "| It's MY turn Human, prepare for this: |",
       "| I just played #{move}",
       ''].each { |x| outputter.call(x) }
      sleep(1.5)
      system('cls') || system('clear')
      board.print_board(outputter)
      self.turn = :p1
      getting_computer_move = false
    end
  end

  def winner(outputter)
    case board.somebody_win?
    when 'x'
      outputter.call('Player one wins')
      true
    when '0'
      if @players[:p2].human == true
        outputter.call('Player two wins')
      else
        outputter.call('I wins, punny human')
      end
      true
    when false

      if board.key.values.none? { |x| x == '-' }

        outputter.call('Draw')
        true
      end
    end
  end

  def playergame_1(outputter, inputer)
    board.print_board(outputter)
    while gaming
      if turn == :p1

        ['', "| It's Your turn Human, tell me your move |",
         "|     Or enter: 'end' for leaving         |", ''].each { |x| outputter.call(x) }
        human_turn(outputter, inputer, turn)
      elsif turn == :p2
        computer_turn(outputter)
      end
      self.gaming = false if winner(outputter)
    end
  end

  def playergame_2(outputter, inputer)
    board.print_board(outputter)
    while gaming
      if turn == :p1

        ['', "| It's Your turn Player One, tell me your move |",
         "|     Or enter: 'end' for leaving         |", ''].each { |x| outputter.call(x) }
        human_turn(outputter, inputer, turn)

      elsif turn == :p2

        ['',
         "| It's Your turn player 2, tell me your move |",
         "|     Or enter: 'end' to surrender      |",
         ''].each { |x| outputter.call(x) }
        human_turn(outputter, inputer, turn)
      end
      self.gaming = false if winner(outputter)
    end
  end
end
