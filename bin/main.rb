#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'



def playergame_1(game)
  putter = lambda {|x| puts x}
  getter = lambda {gets.chomp}
  game.board.print_board(putter)
  while game.gaming

    if game.turn == :p1

      puts ''
      puts "| It's Your turn Human, tell me your move |"
      puts "|     Or enter: 'end' for leaving         |"
      puts ''
      move = gets.chomp
      if move == 'end'
        game.gaming = false
      elsif game.board.key.include? move.to_sym
        unless game.board.key[move.to_sym] == '-'
          puts '|       That position is taken        |'
          next
        end
        game.board.key[move.to_sym] = 'x'
        game.turn = :p2
        system('cls')
        puts "| You just played #{move}"
        game.board.print_board(putter)
        puts '|           PRESS ANY KEY             |'
        gets.chomp

      else
        puts "| I don't know what you're saying, repeat please"
      end

    elsif game.turn == :p2

      getting_computer_move = true
      while getting_computer_move
        move = game.board.key.keys.sample
        next unless game.board.key[move.to_sym] == '-'

        game.board.key[move.to_sym] = '0'
        system('cls')
        puts ''
        puts "| It's MY turn Human, prepare for this: |"
        puts "| I just played #{move}"
        puts ''
        game.board.print_board(putter)
        puts '|           PRESS ANY KEY             |'
        gets.chomp
        game.turn = :p1
        getting_computer_move = false
      end
    end
  end
end

def playergame_2(game)
  game.board.print_board
  while game.gaming
    if game.turn == :p1

      puts ''
      puts "| It's Your turn player 1, tell me your move |"
      puts "|     Or enter: 'end' to surrender        |"
      puts ''
      move = gets.chomp
      if move == 'end'
        game.gaming = false
      elsif game.board.key.include?(move.to_sym)
        unless game.board.key[move.to_sym] == '-'
          puts '|       That position is taken        |'
          next
        end
        game.board.key[move.to_sym] = 'x'
        game.turn = :p2
        system('cls')
        puts "| You just played #{move}"
        game.board.print_board
        puts '|           PRESS ANY KEY             |'
        gets.chomp

      else
        puts "| I don't know what you're saying, repeat please"
      end

    elsif game.turn == :p2

      puts ''
      puts "| It's Your turn player 2, tell me your move |"
      puts "|     Or enter: 'end' to surrender      |"
      puts ''
      move = gets.chomp
      if move == 'end'
        game.gaming = false
      elsif game.board.key.include?(move.to_sym)
        unless game.board.key[move.to_sym] == '-'
          puts '|       That position is taken        |'
          next
        end
        game.board.key[move.to_sym] = '0'
        game.turn = :p1
        system('cls')
        puts "| You just played #{move}"
        game.board.print_board
        puts '|           PRESS ANY KEY             |'
        gets.chomp

      else
        puts "| I don't know what you're saying, repeat please"
      end
    end
  end
end

system('cls')
puts '| ################################## |'
puts '        Welcome to Tic-Tac-Toe'
puts '| ################################## |'
puts ''
puts '| 1: ONE PLAYER GAME'
puts '| 2: TWO PLAYER GAME'
puts '| ################################## |'
puts ''

getting_players = true
getting_difficulty = true
while getting_players

  n_players = gets.chomp

  case n_players
  when '2'
    puts "| You have chosen #{n_players} "
    game = Game.new(n_players) # tell who will play first
    getting_players = false
  when '1'
    puts "| You have chosen #{n_players}, choose your difficulty:"
    while getting_difficulty
      puts '| Set your preffered difficulty (easy, medium or hard)'
      difficulty = gets.chomp
      case difficulty
      when 'easy'
        game = Game.new(n_players, difficulty)
        getting_difficulty = false
      when 'medium'
        game = Game.new(n_players, difficulty)
        getting_difficulty = false
      when 'hard'
        game = Game.new(n_players, difficulty)
        getting_difficulty = false
      else
        puts "Input 'easy','medium' or 'hard' to set your difficulty"
      end
    end
    puts "| You have chosen #{difficulty} difficulty"
    getting_players = false
  else
    puts "| I don't know what you're saying, repeat please"
  end
end

case n_players
when '1'
  playergame_1(game)
when '2'
  playergame_2(game)
end
