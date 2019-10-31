class Game
    attr_writer :a1, :a2, :a3,
                :b1, :b2, :b3,
                :c1, :c2, :c3, :board
    attr_accessor :turn, :board
    def initialize
        @turn = ['player']
        @board = {
            a1: false, a2: false, a3: false,
            b1: false, b2: false, b3: false,
            c1: false, c2: false, c3: false
            }
    end
    def somebody_win?(move)
        return 'x' if @board[:a1] == 'x' and @board[:a2] == 'x' and @board[:a3] == 'x'
        return 'x' if @board[:b1] == 'x' and @board[:b2] == 'x' and @board[:b3] == 'x'
        return 'x' if @board[:c1] == 'x' and @board[:c2] == 'x' and @board[:c3] == 'x'
        return 'x' if @board[:a1] == 'x' and @board[:b2] == 'x' and @board[:c3] == 'x'
        return 'x' if @board[:c1] == 'x' and @board[:b2] == 'x' and @board[:a3] == 'x'
        return 'x' if @board[:a1] == 'x' and @board[:b1] == 'x' and @board[:c1] == 'x'
        return 'x' if @board[:b2] == 'x' and @board[:a2] == 'x' and @board[:c2] == 'x'
        return 'x' if @board[:c3] == 'x' and @board[:b3] == 'x' and @board[:a3] == 'x'
​
        return 'o' if @board[:a1] == 'o' and @board[:a2] == 'o' and @board[:a3] == 'o'
        return 'o' if @board[:b1] == 'o' and @board[:b2] == 'o' and @board[:b3] == 'o'
        return 'o' if @board[:c1] == 'o' and @board[:c2] == 'o' and @board[:c3] == 'o'
        return 'o' if @board[:a1] == 'o' and @board[:b2] == 'o' and @board[:c3] == 'o'
        return 'o' if @board[:c1] == 'o' and @board[:b2] == 'o' and @board[:a3] == 'o'
        return 'o' if @board[:a1] == 'o' and @board[:b1] == 'o' and @board[:c1] == 'o'
        return 'o' if @board[:b2] == 'o' and @board[:a2] == 'o' and @board[:c2] == 'o'
        return 'o' if @board[:c3] == 'o' and @board[:b3] == 'o' and @board[:a3] == 'o'
        return false
    end
end

puts '| ################################## |'
puts '|        Welcome to Tic-Tac-Toe'
puts '| ################################## |'
puts ''
puts '| 1: ONE PLAYER GAME'
puts '| 2: PLAYER VS COMPUTER'
puts '| ################################## |'
puts ''

game = Game.new
getting_players = true
while getting_players
    n_players = gets.chomp
    case n_players
    when '2'
      puts "You have chosen to play against me... ok"
      getting_players = false
    when '1'
      puts "| You have chose to play by yourself, don't worry you'll have friends some day... maybe"
      getting_players = false
    else
      puts "| I don't know what you are saying, please repeat again |"
    end
end

gaming = true

while gaming
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
    puts game.board.keys
    if game.turn.last == 'player'
        puts "| It's Your turn Human, tell me your move |"
        puts "|     Or enter: 'end' for leaving         |"
        puts ''
        move = gets.chomp
        if move == 'end'
            gaming == false
            break
        elsif game.board.keys.include? move.to_sym
            puts "| You just played #{move} |"
            game.turn.push('computer')
            puts game.turn
        else
            puts "| I don't know what you're saying, repeat please"
        end
    else
        puts "| It's MY turn Human, prepare for this: |"
        move = game.board.keys.sample
        puts "| I just played #{move}"
        game.turn.push('player')
        puts game.turn
    end
end