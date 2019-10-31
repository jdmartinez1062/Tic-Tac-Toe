class Game
    attr_writer :a1, :a2, :a3,
                :b1, :b2, :b3,
                :c1, :c2, :c3, :board
    attr_accessor :turn, :board
    def initialize
        @turn = ['player']
        @board = {
            a1: '-', a2: '-', a3: '-',
            b1: '-', b2: '-', b3: '-',
            c1: '-', c2: '-', c3: '-'
            }
    end
    def print_board

        puts '| ################################## |'
        puts '| ################################## |'
        puts '| ################################## |'
        puts ''
        puts '  | 1 | 2 | 3 |'
        puts "a | #{@board[:a1]} | #{@board[:a2]} | #{@board[:a3]} |"
        puts "b | #{@board[:b1]} | #{@board[:b2]} | #{@board[:b3]} |"
        puts "c | #{@board[:c3]} | #{@board[:c2]} | #{@board[:c3]} |"
        puts ''
        puts '| ################################## |'
        puts '| ################################## |'
        puts '| ################################## |'
        puts ''
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
    game.print_board
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
            game.board[move.to_sym] = 'x'
            game.turn.push('computer')
            
        else
            puts "| I don't know what you're saying, repeat please"
        end
    end
    if game.turn.last == 'computer'
        puts "| It's MY turn Human, prepare for this: |"
        move = game.board.keys.sample
        puts "| I just played #{move}"
        game.board[move.to_sym] = '0'
        game.turn.push('player')
        
    end
end