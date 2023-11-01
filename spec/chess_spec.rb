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

describe ChessGame do
    let(:white_pawn) { ChessPiece::WHITE_PAWN }
    let(:black_pawn) { ChessPiece::BLACK_PAWN }
    let(:black_rook) { ChessPiece::BLACK_ROOK }
    let(:white_rook) { ChessPiece::WHITE_ROOK }
    let(:white_bishop) { ChessPiece::WHITE_BISHOP }
    let(:white_knight) { ChessPiece::WHITE_KNIGHT }
    let(:white_king) { ChessPiece::WHITE_KING }
    let(:white_queen) { ChessPiece::WHITE_QUEEN }
    let(:game) {described_class.new}

    describe '#pawn_movement' do
        context 'when the pawn is white' do
            it 'returns valid moves for a regular forward move' do
                moves = game.pawn_movement(3, 2, :white)
                expect(moves).to contain_exactly([3, 3])
            end

            it 'returns valid moves for a double move on the first turn' do
                moves = game.pawn_movement(3, 1, :white)
                expect(moves).to contain_exactly([3, 2], [3, 3]) # Assuming (3, 2) and (3, 3) are valid moves
            end

            it 'filters out invalid moves' do
                moves = game.pawn_movement(7, 7, :white)
                expect(moves).to be_empty # Assuming (7, 8) is an invalid move
            end
        end

        context 'when the pawn is black' do
            it 'returns valid moves for a regular forward move' do
                moves = game.pawn_movement(3, 5, :black)
                expect(moves).to contain_exactly([3, 4])
            end

            it 'returns valid moves for a double move on the first turn' do
                moves = game.pawn_movement(3, 6, :black)
                expect(moves).to contain_exactly([3, 5], [3, 4])
            end

            it 'filters out invalid moves' do
                moves = game.pawn_movement(0, 0, :black)
                expect(moves).to be_empty 
            end
        end
    end

    describe '#rook_movement' do
        context 'when black rook is in the middle of the board' do
            let(:start_column) { 3 }
            let(:start_row) {3}

            it 'returns valid horizontal and vertical moves' do
                moves = game.rook_movement(start_column, start_row)

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
                moves = game.rook_movement(start_column, start_row)
        
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
                moves = game.rook_movement(start_column, start_row)

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
                moves = game.rook_movement(start_column, start_row)
        
                # Check horizontal moves
                expect(moves).to include([0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7])
        
                # Check vertical moves
                expect(moves).to include([7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6])
            end
        end
    end

    describe '#bishop_movement' do
        context 'when bishop is in the center of the board' do
            let(:start_column) { 4 }
            let(:start_row) { 4 }

            it 'returns valid diagonal moves' do
                moves = game.bishop_movement(start_column, start_row)

                # check diagonal moves
                expect(moves).to include([5, 5], [6, 6], [7, 7])
                expect(moves).to include([3, 3], [2, 2], [1, 1], [0, 0])
                expect(moves).to include([5, 3], [6, 2], [7, 1])
                expect(moves).to include([3, 5], [2, 6], [1, 7])
            end
        end

        context 'when bishop is at the edge of the board' do
            let(:start_column) { 7 }
            let(:start_row) { 0 }
            
            it 'returns valid diagonal moves' do
                moves = game.bishop_movement(start_column, start_row)

                # Check diagonal moves
                expect(moves).to include([6, 1], [5, 2], [4, 3], [3, 4], [2, 5], [1, 6], [0, 7])
            end
        end
    end

    describe '#knight_movement' do
        context ' when the knight is in the middle of the board' do
            it 'returns valid knight moves' do
                moves = game.knight_movement(3, 3) # Assuming the knight is in the middle

                expect(moves).to contain_exactly([1, 2], [2, 1], [4, 1], [5, 2], [5, 4], [4, 5], [2, 5], [1, 4])
            end
        end

        context 'when knight is at the edge of the board' do
            it 'returns valid knight moves' do
                moves = game.knight_movement(0, 0) # Assuming the knight is at the top-left corner
        
                expect(moves).to contain_exactly([1, 2], [2, 1])
            end
        end
        
        context 'when knight is at a corner of the board' do
            it 'returns valid knight moves' do
                moves = game.knight_movement(7, 7) # Assuming the knight is at the bottom-right corner
        
                expect(moves).to contain_exactly([5, 6], [6, 5])
            end
        end
    end

    describe '#king_movement' do
        context 'when the king is at the center of the board' do
            let(:column) { 4 }
            let(:row) { 4 }

            it 'returns valid king moves' do
                moves = game.king_movement(column, row)

                expected_moves = [
                    [5, 4], [3, 4], [4, 5], [4, 3],
                    [5, 5], [3, 3], [5, 3], [3, 5]
                ]

                expect(moves).to contain_exactly(*expected_moves)
            end
        end

        context 'when king is at the corner of the board' do
            let(:column) { 0 }
            let(:row) { 0 }
      
            it 'returns valid king moves' do
                moves = game.king_movement(column, row)
      
                expected_moves = [
                    [1, 0], [0, 1], [1, 1]
                ]
      
                expect(moves).to contain_exactly(*expected_moves)
            end
        end

        context 'when king is at the left edge of the board' do
            let(:column) { 0 }
            let(:row) { 4 }
      
            it 'returns valid king moves' do
                moves = game.king_movement(column, row)
      
                expected_moves = [
                    [0, 5], [1, 5], [1, 4], [1, 3], [0, 3]
                ]
      
                expect(moves).to contain_exactly(*expected_moves)
            end
        end
    end

    describe '#queen_movement' do
        let(:column) { 3 }
        let(:row) { 3 }

        it 'returns valid queen moves combining rook and bishop movements' do
            queen_moves = game.queen_movement(column, row)

            expected_moves = [
                [0, 3], [1, 3], [2, 3], [4, 3], [5, 3], [6, 3], [7, 3],  # Rook moves
                [3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7],  # Rook moves
                [2, 2], [1, 1], [0, 0], [4, 4], [5, 5], [6, 6], [7, 7],  # Bishop moves
                [4, 2], [5, 1], [6, 0], [2, 4], [1, 5], [0, 6],           # Bishop moves
            ]

            expect(queen_moves).to contain_exactly(*expected_moves)
        end
    end
end

#describe ChessGame do
    #let(:player_one) { Player.new("Player1", "white") }
    #let(:player_two) { Player.new("Player2", "black") }
    #subject(:game) { described_class.new }

    #describe '#pawn_capture' do
        #context "when player one moves to a valid destination occupied by player two's piece" do
           # it "should capture player two's piece" do
                #game.instance_variable_set(:@current_player, 'player_one')
               # game.instance_variable_set(:@black_pieces, [ChessPiece::Piece::BLACK_PAWN,  ChessPiece::Piece::BLACK_KNIGHT])
                #game.instance_variable_set(:@white_pieces, [ChessPiece::Piece::WHITE_PAWN,  ChessPiece::Piece::WHITE_KNIGHT])

                #game.pawn_capture(1, 2, 1, 4, @current_player)
    
                #expect(@black_pieces.length).to eq(@black_pieces.length - 1)
            #end
        #end
    #end
#end