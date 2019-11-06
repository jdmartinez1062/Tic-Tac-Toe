require './lib/board.rb'
require './lib/game.rb'
require './lib/player.rb'

describe 'Tic-tac-toe' do
    let(:board) {Board.new()}
    let(:play)  {board.key[:a1] = '0'}
    let(:play1) {board.key[:a2] = '0'}
    let(:play2) {board.key[:a3] = '0'}
    
    describe '#somebody_win?' do
        it 'tells you if a combo is a winning combo' do
            play
            play1
            play2
            expect(board.somebody_win?).to eql('0')
        end
    end
end
def foo
end