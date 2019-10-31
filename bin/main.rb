#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'

system('cls')

puts '| ################################## |'
puts '        Welcome to Tic-Tac-Toe'
puts '| ################################## |'
puts ''
puts '| 1: ONE PLAYER GAME'
puts '| 2: TWO PLAYER GAME'
​
puts '| ################################## |'
puts ''

getting_players = true
getting_difficulty= true
while getting_players
  
  n_players = gets.chomp
 
  case n_players
  when '2'
    puts "| You have chosen #{n_players} "
    game = Game.new(n_players) #tell who will play first
    getting_players = false
  when '1'
    puts "| You have chosen #{n_players}, choose your difficulty:"
    while getting_difficulty
      puts "| Set your preffered difficulty (easy, medium or hard)"
      difficulty = gets.chomp
      case difficulty
      when 'easy'
        game = Game.new(n_players, difficulty)
      when 'medium'
        game = Game.new(n_players, difficulty)
      when 'hard'
        game = Game.new(n_players, difficulty)
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
​
turn = ['player']
gaming = true
​
while gaming
  ​
  puts '| ################################## |'
  puts '| ################################## |'
  puts '| ################################## |'
  puts ''
  puts '  | 1 | 2 | 3 |'
  puts 'a | - | - | - |'
  puts 'b | - | - | - |'
  puts 'c | - | - | - |'
  puts ''
  puts '| ################################## |'
  puts '| ################################## |'
  puts '| ################################## |'
  puts ''
  puts "| It's Your turn Human, tell me your move |"
  puts "| Or enter 'end' for leaving |"
  ​
  move = gets.chomp
  if move == 'end'
    game.gaming = false
  elsif move.start_with?('a') || move.start_with?('b') || move.start_with?('c')
    puts "| You just played #{move}"
  else
    puts "| I don't know what you're saying, repeat please"
  end
  while gaming
    game.print_board
    if game.turn.last == 'player'
      puts "| It's Your turn Human, tell me your move |"
      puts "|     Or enter: 'end' for leaving         |"
      puts ''
      move = gets.chomp
      if move == 'end'
        @gaming = false
        elsif game.board.keys.include? move.to_sym
        puts "| You just played #{move} |"
        game.board[move.to_sym] = 'x'
        game.turn.push('computer')
  
      else
        puts "| I don't know what you're saying, repeat please"
      end
    end
    next unless game.turn.last == 'computer'
  
    puts "| It's MY turn Human, prepare for this: |"
    move = game.board.keys.sample
    puts "| I just played #{move}"
    game.board[move.to_sym] = '0'
    game.turn.push('player')
  end
end
