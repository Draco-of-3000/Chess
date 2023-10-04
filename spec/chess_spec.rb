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

describe ChessPiece do
    let(:white_pawn) { ChessPiece::WHITE_PAWN }
    let(:black_pawn) { ChessPiece::BLACK_PAWN }
    let(:chesspiece) { described_class.new }

    describe '#pawn_movement' do
        context 'when the pawn is white' do
            it 'returns valid moves for a regular forward move' do
                moves = white_pawn.pawn_movement(3, 2, :white)
                expect(moves).to contain_exactly([3, 3])
            end

            it 'returns valid moves for a double move on the first turn' do
                moves = white_pawn.pawn_movement(3, 1, :white)
                expect(moves).to contain_exactly([3, 2], [3, 3]) # Assuming (3, 2) and (3, 3) are valid moves
            end

            it 'filters out invalid moves' do
                moves = white_pawn.pawn_movement(7, 7, :white)
                expect(moves).to be_empty # Assuming (7, 8) is an invalid move
            end
        end

        context 'when the pawn is black' do
            it 'returns valid moves for a regular forward move' do
                moves = black_pawn.pawn_movement(3, 5, :black)
                expect(moves).to contain_exactly([3, 4])
            end

            it 'returns valid moves for a double move on the first turn' do
                moves = black_pawn.pawn_movement(3, 6, :black)
                expect(moves).to contain_exactly([3, 5], [3, 4])
            end

            it 'filters out invalid moves' do
                moves = black_pawn.pawn_movement(0, 0, :black)
                expect(moves).to be_empty 
            end
        end
    end
end