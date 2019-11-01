#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
putter = ->(x) { puts x }
getter = -> { gets.chomp }
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
    
    system('cls')
    game = Game.new(n_players)
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
        system('cls')
      when 'medium'
        game = Game.new(n_players, difficulty)
        getting_difficulty = false
        system('cls')
      when 'hard'
        game = Game.new(n_players, difficulty)
        getting_difficulty = false
        system('cls')
      else
        puts "Input 'easy','medium' or 'hard' to set your difficulty"
      end
    end
    getting_players = false
  else
    puts "| I don't know what you're saying, repeat please"
  end
end

case n_players
when '1'
  game.playergame_1(putter, getter)
when '2'
  game.playergame_2(putter, getter)
end
