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
    let(:black_rook) { ChessPiece::BLACK_ROOK }
    let(:white_rook) { ChessPiece::WHITE_ROOK }
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

    describe '#rook_movement' do
        context 'when black rook is in the middle of the board' do
            let(:start_column) { 3 }
            let(:start_row) {3}

            it 'returns valid horizontal and vertical moves' do
                moves = black_rook.rook_movement(start_column, start_row)

                # Check horizontal moves
                expect(moves).to include([0, 3], [1, 3], [2, 3], [4, 3], [5, 3], [6, 3], [7, 3])

                # Check vertical moves
                expect(moves).to include([3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7])
            end
        end

        context 'when black rook is at the edge of the board' do
            let(:start_column) { 0 }
            let(:start_row) { 0 }

            it 'returns valid horizontal and vertical moves' do
                moves = black_rook.rook_movement(start_column, start_row)
        
                # Check horizontal moves
                expect(moves).to include([1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0])
        
                # Check vertical moves
                expect(moves).to include([0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7])
            end
        end

        context 'when white rook is in the middle of the board' do
            let(:start_column) { 3 }
            let(:start_row) {3}

            it 'returns valid horizontal and vertical moves' do
                moves = white_rook.rook_movement(start_column, start_row)

                # Check horizontal moves
                expect(moves).to include([0, 3], [1, 3], [2, 3], [4, 3], [5, 3], [6, 3], [7, 3])

                # Check vertical moves
                expect(moves).to include([3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7])
            end
        end

        context 'when white rook is at the edge of the board' do
            let(:start_column) { 7 }
            let(:start_row) { 7 }

            it 'returns valid horizontal and vertical moves' do
                moves = white_rook.rook_movement(start_column, start_row)
        
                # Check horizontal moves
                expect(moves).to include([0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7])
        
                # Check vertical moves
                expect(moves).to include([7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6])
            end
        end
    end
end