require './lib/chess'

describe Chessboard do
    let(:chessboard) { Chessboard.new }

    describe '#initialize' do
        context 'when the game is initialized' do
            it 'creates an 8x8 board' do
                expect(chessboard.board.length).to eq(8)
                expect(chessboard.board.all? { |row| row.length == 8 }).to be(true)
            end
        end
    end

    describe '#setup_board' do
        it 'sets up the initial chessboard' do
            chessboard.setup_board

            # Check major pieces for black
            expect(chessboard.board[7]).to eq(["♖", "♘", "♗", "♕", "♔", "♗", "♘", "♖"])
            # Check pawns for black
            expect(chessboard.board[6]).to eq(["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"])

            # Check pawns for white
            expect(chessboard.board[0]).to eq(["♜", "♞", "♝", "♛", "♚", "♝", "♞", "♜"])
            # Check pawns for white
            expect(chessboard.board[1]).to eq(["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"])
        end
    end
end