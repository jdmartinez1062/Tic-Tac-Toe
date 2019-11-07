# frozen_string_literal: true

require './lib/board.rb'
require './lib/game.rb'
require './lib/player.rb'

describe 'Tic-tac-toe' do
  let(:board) { Board.new }
  let(:draw) do
    board.key = {
      a1: 'x', a2: '0', a3: 'x',
      b1: '0', b2: 'x', b3: '0',
      c1: '0', c2: 'x', c3: '0'
    }
  end
  let(:draw1) do
    board.key = {
      a1: '-', a2: '-', a3: '0',
      b1: '0', b2: 'x', b3: '0',
      c1: '0', c2: 'x', c3: '-'
    }
  end

  describe '#somebody_win?' do
    it 'tells you if a combo is a winning combo for "0" when the board is full' do
      draw[:a3] = '0'
      expect(board.somebody_win?).to eql('0')
    end
    it 'tells you if a combo is a winning combo for "0" when the board is not full' do
      draw[:a3] = '0'
      draw[:a1] = '-'
      expect(board.somebody_win?).to eql('0')
    end
    it 'tells you if a combo is a winning combo for "x" when the board is full' do
      draw[:c3] = 'x'

      expect(board.somebody_win?).to eql('x')
    end
    it 'tells you if a combo is a winning combo for "x" when the board is not full' do
      draw[:c3] = 'x'
      draw[:b1] = '-'
      expect(board.somebody_win?).to eql('x')
    end
    it 'tells you if nobody has won' do
      draw1
      expect(board.somebody_win?).to eql(false)
    end
  end

  describe '#winner_mock' do
    let(:game1) { Game.new('1') }
    let(:game2) { Game.new('2') }
    let(:draw1) do
      game1.board.key = {
        a1: 'x', a2: '0', a3: 'x',
        b1: '0', b2: 'x', b3: '0',
        c1: '0', c2: 'x', c3: '0'
      }
    end
    let(:draw2) do
      game2.board.key = {
        a1: 'x', a2: '0', a3: 'x',
        b1: '0', b2: 'x', b3: '0',
        c1: '0', c2: 'x', c3: '0'
      }
    end
    it "tells you if player 1 has won when the board is full and it's a single player game" do
      draw1[:c3] = 'x'
      expect(game1.winner_mock).to eql('Player one wins')
    end
    it "tells you if player 1 has won when the board is full and it's a single player game" do
      draw1[:c3] = 'x'
      draw1[:b1] = '-'
      expect(game1.winner_mock).to eql('Player one wins')
    end
    it 'tells you if the machine has won when the board is full ' do
      draw1[:a3] = '0'
      expect(game1.winner_mock).to eql('I wins, punny human')
    end
    it 'tells you if the machine has won when the board is not full ' do
      draw1[:a3] = '0'
      draw1[:b1] = '-'
      expect(game1.winner_mock).to eql('I wins, punny human')
    end
    it 'tells you if the game is a draw in a single player game ' do
      draw1
      expect(game1.winner_mock).to eql('Draw')
    end
    it "tells you if player 1 has won when the board is full and it's a two player game" do
      draw2[:c3] = 'x'
      draw2[:b1] = '-'
      expect(game2.winner_mock).to eql('Player one wins')
    end
    it "tells you if player 1 has won when the board is full and it's a two player game" do
      draw2[:c3] = 'x'
      expect(game2.winner_mock).to eql('Player one wins')
    end
    it 'tells you if the player 2 has won when the board is full ' do
      draw2[:a3] = '0'
      draw2[:b1] = '-'
      expect(game2.winner_mock).to eql('Player two wins')
    end
    it 'tells you if the player 2 has won when the board is not full ' do
      draw2[:a3] = '0'
      draw2[:b1] = '-'
      expect(game2.winner_mock).to eql('Player two wins')
    end
    it 'tells you if the game is a draw in a two player game ' do
      draw2
      expect(game2.winner_mock).to eql('Draw')
    end
  end

  describe '#next_player' do
    let(:game1) { Game.new('1') }
    let(:game2) { Game.new('2') }
    let(:draw1) do
      game1.board.key = {
        a1: 'x', a2: '0', a3: 'x',
        b1: '0', b2: 'x', b3: '0',
        c1: '0', c2: 'x', c3: '0'
      }
    end
    let(:draw2) do
      game2.board.key = {
        a1: 'x', a2: '0', a3: 'x',
        b1: '0', b2: 'x', b3: '0',
        c1: '0', c2: 'x', c3: '0'
      }
    end
    it 'Next player for a single player game at start ' do
      expect(game1.next_player(game1.turn)).to eql(:p2)
    end
    it 'Next player for a single player game after machine turn ' do
      game1.turn=:p2
      expect(game1.next_player(game1.turn)).to eql(:p1)
    end
    it 'Next player for a two player game at start' do
      expect(game2.next_player(game2.turn)).to eql(:p2)
    end
    it 'Next player for a single player game after machine turn ' do
      game2.turn=:p2
      expect(game1.next_player(game2.turn)).to eql(:p1)
    end
  end
end
