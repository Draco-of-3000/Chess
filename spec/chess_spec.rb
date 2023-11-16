require './lib/chess'

describe ChessBoard do
    let(:chessboard) { ChessBoard.new }

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
    let(:white_pawn_1) { ChessPiece::WHITE_PAWN_1 }
    let(:black_pawn_1) { ChessPiece::BLACK_PAWN_1}
    let(:white_pawn_6) { ChessPiece::WHITE_PAWN_6}
    let(:black_pawn_6) { ChessPiece::BLACK_PAWN_6}
    let(:black_rook) { ChessPiece::BLACK_ROOK }
    let(:white_rook) { ChessPiece::WHITE_ROOK }
    let(:white_bishop) { ChessPiece::WHITE_BISHOP }
    let(:white_knight) { ChessPiece::WHITE_KNIGHT }
    let(:white_king) { ChessPiece::WHITE_KING }
    let(:white_queen) { ChessPiece::WHITE_QUEEN }
    let(:@player_one) { Player.new("Player1", "white") }
    let(:@player_two) { Player.new("Player2", "black") }
    let(:fake_opponent_piece) { double(start_column: 1, start_row: 4, name: 'black_pawn_1') }
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

    describe '#capture_piece' do
        before do
            ENV['SKIP_REPLACE_PIECE'] = 'true'
        end

        context "when player one moves to capture an opponent's piece at (1, 4)" do
          it "should capture the opponent's piece and reduce the opponent's piece count by 1" do
            game.instance_variable_set(:@current_player, game.instance_variable_get(:@player_one))
      
            opponent_piece_1 = double(start_column: 0, start_row: 6, current_column: 1, current_row: 4, name: 'Black Pawn 1')
            opponent_piece_2 = double(start_column: 1, start_row: 7, current_column: 2, current_row: 5, name: 'Black Knight')
      
            game.instance_variable_set(:@black_pieces, [ChessPiece::BLACK_PAWN_6, opponent_piece_1, opponent_piece_2])
            game.instance_variable_set(:@white_pieces, [ChessPiece::WHITE_PAWN_6, ChessPiece::WHITE_KNIGHT])
      
            initial_black_pieces_length = game.instance_variable_get(:@black_pieces).length
      
            game.capture_piece(1, 6, 1, 4)
      
            updated_black_pieces_length = game.instance_variable_get(:@black_pieces).length
      
            expect(updated_black_pieces_length).to eq(initial_black_pieces_length - 1)
            expect(game.instance_variable_get(:@player_two_pieces_remaining)).to eq(15)
          end
        end
    end

    describe '#en_passant_possible' do
        context 'when en passant is possible' do
            it 'returns true' do
                game.instance_variable_set(:@current_player, 'player_one')
                game.instance_variable_set(:@double_move_made, true)
      
                opponent_piece_1 = double(start_column: 0, start_row: 6, current_column: 1, current_row: 4, name: 'Black Pawn 1')
                opponent_piece_2 = double(start_column: 1, start_row: 7, current_column: 2, current_row: 5, name: 'Black Knight')
      
                game.instance_variable_set(:@black_pieces, [ChessPiece::BLACK_PAWN_6, opponent_piece_1, opponent_piece_2])
                game.instance_variable_set(:@white_pieces, [ChessPiece::WHITE_PAWN_6, ChessPiece::WHITE_KNIGHT])

                expect(game.en_passant_possible?(1, 4, :white)).to be(true)
            end
        end
    end

    describe '#en_passant_capture' do
        it "captures the opponent's pawn en passant" do
            game.instance_variable_set(:@current_player, 'player_one')
            game.instance_variable_set(:@double_move_made, true)
      
            opponent_piece_1 = double(start_column: 0, start_row: 6, current_column: 1, current_row: 4, name: 'Black Pawn 1')
            opponent_piece_2 = double(start_column: 1, start_row: 7, current_column: 2, current_row: 5, name: 'Black Knight')
      
            game.instance_variable_set(:@black_pieces, [ChessPiece::BLACK_PAWN_6, opponent_piece_1, opponent_piece_2])
            game.instance_variable_set(:@white_pieces, [ChessPiece::WHITE_PAWN_6, ChessPiece::WHITE_KNIGHT])

            # Capture the pawn en passant
            game.en_passant_capture(1, 4, :white)

            # Check that the opponent's pawn is captured, and pieces and counts are updated
            expect(game.instance_variable_get(:@pieces_captured_by_player_one)).to eq(1)
            expect(game.instance_variable_get(:@player_two_pieces_remaining)).to eq(15)
        end
    end

    describe '#get_piece_at' do
        context 'when a piece exists at the specified column and row' do
            it 'should return the correct piece' do
                piece = ChessPiece.new('Black Pawn 2', "\u265F", 1, 6, 'black')
  
                game.instance_variable_set(:@black_pieces, [ChessPiece::BLACK_PAWN_1, piece])
                column = 1
                row = 6
            
                retrieved_piece = game.get_piece_at(column, row)
            
                expect(retrieved_piece).to eq(piece)
          end
        end
      
        context 'when there is no piece at the specified column and row' do
            it 'should return nil' do
                column = 1
                row = 4
      
                retrieved_piece = game.get_piece_at(column, row)
      
                expect(retrieved_piece).to be_nil
            end
        end
    end

    describe '#castling_possible?' do
        before do
            game.instance_variable_set(:@current_player, 'player_two')
        end

        context 'when castling is possible' do
            before do
                allow(game).to receive(:castling_possible?).and_return(true)
            end

            it 'should return true' do
                expect(game.castling_possible?(:black)).to be_truthy
            end
        end

        context 'when castling is not possible due to king movement' do
            before do
                game.instance_variable_set(:@king_moved, true) # King has moved.
                game.instance_variable_set(:@rook_moved, false) # Rook has not moved.
            end
        
            it 'should return false' do
              expect(game.castling_possible?(:black)).to be_falsey
            end
        end
        
        context 'when castling is not possible due to rook movement' do
            before do
              game.instance_variable_set(:@king_moved, false)
              game.instance_variable_set(:@rook_moved, true) # Rook has moved.
            end
        
            it 'should return false' do
              expect(game.castling_possible?(:black)).to be_falsey
            end
        end
    end

    describe '#castling' do
        before do
            ENV['SKIP_CAPTURE_PIECE'] = 'true'
        end
        context 'when castling is valid' do
            it 'should allow kingside castling for white' do
              # Set up the initial board state
              game.move_piece(4, 0, 6, 0) # Move a piece out of the way
              game.move_piece(7, 0, 5, 0) # Move the rook out of the way
              game.instance_variable_set(:@king_moved, false)
              game.instance_variable_set(:@rook_moved, false)
        
              # Perform castling
              game.castling(:white)
        
              # Check that the king and rook are in the new positions
              allow(game).to receive(:get_piece_at).with(6, 0).and_return(double(name: 'White King'))
              allow(game).to receive(:get_piece_at).with(5, 0).and_return(double(name: 'White Rook'))
              expect(game.get_piece_at(6, 0)&.name).to eq('White King')
              expect(game.get_piece_at(5, 0)&.name).to eq('White Rook')
        
              # Check that the king and rook are marked as moved
              expect(game.instance_variable_get(:@king_moved)).to be_truthy
              expect(game.instance_variable_get(:@rook_moved)).to be_truthy
            end
        
            it 'should allow queenside castling for black' do
              # Set up the initial board state
              game.move_piece(4, 0, 2, 0) # Move a piece out of the way
              game.move_piece(0, 0, 3, 0) # Move the rook out of the way
              game.instance_variable_set(:@king_moved, false)
              game.instance_variable_set(:@rook_moved, false)
        
              # Perform castling
              game.castling(:black)
        
              # Check that the king and rook are in the new positions
              allow(game).to receive(:get_piece_at).with(2, 0).and_return(double(name: 'Black King'))
              allow(game).to receive(:get_piece_at).with(3, 0).and_return(double(name: 'Black Rook'))
              expect(game.get_piece_at(2, 0)&.name).to eq('Black King')
              expect(game.get_piece_at(3, 0)&.name).to eq('Black Rook')
        
              # Check that the king and rook are marked as moved
              expect(game.instance_variable_get(:@king_moved)).to be_truthy
              expect(game.instance_variable_get(:@rook_moved)).to be_truthy
            end
        end
    end

    describe '#replace_piece' do
        context 'when a piece is capture or replaced at a coordinate' do
            it 'replaces piece on the board' do
                
                old_piece = ChessPiece.new('Old Piece', 'O', 1, 0, 'black')
                new_piece = ChessPiece.new('New Piece', 'N', 2, 0, 'white')
                game.instance_variable_set(:@board, [
                  [old_piece, nil, nil, nil],
                  [nil, old_piece, nil, nil],
                  [nil, nil, old_piece, nil],
                  [nil, nil, nil, old_piece]
                ])
          
                game.replace_piece(old_piece, new_piece)
          
                # Ensure that the old piece is replaced with the new piece on the board
                expect(game.instance_variable_get(:@board)).to eq([
                  [new_piece, nil, nil, nil],
                  [nil, new_piece, nil, nil],
                  [nil, nil, new_piece, nil],
                  [nil, nil, nil, new_piece]
                ])
            end
        end

        context 'when there is no piece to replace' do
            it 'does not modify board' do
                old_piece = ChessPiece.new('Old Piece', 'O', 1, 0, 'black')
                new_piece = ChessPiece.new('New Piece', 'N', 2, 0, 'white')
                game.instance_variable_set(:@board, [
                  [nil, nil, nil, nil],
                  [nil, nil, nil, nil],
                  [nil, nil, nil, nil],
                  [nil, nil, nil, nil]
                ])
          
                game.replace_piece(old_piece, new_piece)
          
                # Ensure that the board remains unchanged when old piece is not found
                expect(game.instance_variable_get(:@board)).to eq([
                  [nil, nil, nil, nil],
                  [nil, nil, nil, nil],
                  [nil, nil, nil, nil],
                  [nil, nil, nil, nil]
                ])
            end
        end
    end

    describe '#pawn_promotion' do
        it 'promotes a pawn to a queen' do
            
            game.pawn_promotion(0, 7, @current_player)
            game.instance_variable_set(:@current_player, 'player_one')
            game.instance_variable_set(:@board, [
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [ChessPiece::WHITE_PAWN_1, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil]
            ])

            pawn = ChessPiece.new('White Pawn 1', "\u2659", 0, 1, 'white')
            piece_choice = 'queen'
            piece_color = :white
            new_piece = ChessPiece.new('White Queen', "\u2655", 0, 7, 'white')
            game.instance_variable_set(:@board, [
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [ChessPiece::WHITE_QUEEN, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil]
            ])

            updated_board = [
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [ChessPiece::WHITE_QUEEN, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil]
            ]

            
    
            # Stub the replace_piece method to update the game's board
            allow(game).to receive(:replace_piece).with(pawn, new_piece)

            expect(game.instance_variable_get(:@board)).to eq(updated_board)   
        end
    end

    describe '#king_in_check?' do
        context 'when the king is in check' do
            before do
                game.instance_variable_set(:@current_player, Player.new("Player2", "black"))

                king_piece = ChessPiece::BLACK_KING
                king_piece.current_column = 0
                king_piece.current_row = 7

                white_bishop = ChessPiece::WHITE_BISHOP
                white_bishop.current_column = 7
                white_bishop.current_row = 0

                game.instance_variable_set(:@white_pieces, [white_bishop])
                game.instance_variable_set(:@black_pieces, [king_piece])

                game.instance_variable_set(:@board, [
                    [king_piece, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, white_bishop]
                ])

                allow(game).to receive(:pawn_movement).and_return([[1, 6]])
                allow(game).to receive(:rook_movement).and_return([[1, 0]])
                allow(game).to receive(:knight_movement).and_return([[2, 5]])
                allow(game).to receive(:queen_movement).and_return([[3, 4]])
                allow(game).to receive(:king_movement).and_return([[4, 3]])
            end

            it 'should return true' do
                allow(game).to receive(:bishop_movement).with(7, 0).and_return(0, 7)
                allow(game).to receive(:king_in_check?).and_return(true)
                game.instance_variable_set(:@in_check, true)
                result = game.king_in_check?
                expect(result).to be true
                expect(game.instance_variable_get(:@in_check)).to be true
            end
        end
    end

    describe '#checkmate?' do
        before do
            allow(game).to receive(:pawn_movement)
            allow(game).to receive(:knight_movement)
        end
        context 'when the king is not in check' do
            it 'returns false' do
                expect(game.checkmate?).to be_falsey
            end
        end

        context 'when the king is in checkmate' do
            it 'returns true' do
                game.instance_variable_set(:@in_check, true)
                allow(game).to receive(:checkmate_possible?).and_return(false)
                allow(game).to receive(:checkmate?).and_return(true)
                result = game.checkmate?
                expect(result).to be_truthy
            end
        end

        context 'when the king is in check but can escape checkmate' do
            it 'returns falsey checkmate' do
                game.instance_variable_set(:@in_check, true)

                allow(game).to receive(:checkmate_possible?).and_return(true)
                allow(game).to receive(:checkmate?).and_return(false)
                result = game.checkmate?
                expect(result).to be_falsey
            end
        end
    end

    describe '#checkmate_possible?' do
        let(:game) { ChessGame.new }
    
        context 'when the king is not in check' do
            it 'returns true for any move' do
                game.instance_variable_set(:@in_check, false)
                piece = instance_double("Piece", current_row: 0, current_column: 0, name: "Pawn")
                moves = [[1, 1], [2, 2]]  # Example moves, they don't matter for this test
                expect(game.checkmate_possible?(piece, moves)).to be_truthy
            end
        end
    
        context 'when the king is in check' do
            it 'returns false for any move' do
                game.instance_variable_set(:@in_check, true)
                allow(game).to receive(:checkmate_possible?).and_return(false)
                piece = instance_double("Piece", current_row: 0, current_column: 0, name: "Pawn")
                moves = [[1, 1], [2, 2]]  # Example moves, they don't matter for this test
                expect(game.checkmate_possible?(piece, moves)).to be_falsey
            end
        end
    end

    describe '#find_pieces' do
        context 'when there are only kings on both sides' do
            before do
                white_king_piece = ChessPiece::WHITE_KING
                black_king_piece = ChessPiece::BLACK_KING
                game.instance_variable_set(:@white_pieces, [white_king_piece])
                game.instance_variable_set(:@black_pieces, [black_king_piece])
            end

            it 'sets @insufficient_material to true' do
                result = game.find_pieces
                expect(game.instance_variable_get(:@insufficient_material)).to be true
            end

            it 'returns true' do
                result = game.find_pieces
                expect(result).to be true
            end
        end

        context 'when there are kings and a knight on both sides' do
            before do
                white_king_piece = ChessPiece::WHITE_KING
                black_king_piece = ChessPiece::BLACK_KING
                white_knight_piece = ChessPiece::WHITE_KNIGHT
                black_knight_piece = ChessPiece::BLACK_KNIGHT
                white_bishop_piece = ChessPiece::WHITE_BISHOP
                black_bishop_piece = ChessPiece::BLACK_BISHOP 
                game.instance_variable_set(:@white_pieces, [white_king_piece, white_knight_piece])
                game.instance_variable_set(:@black_pieces, [black_king_piece, black_knight_piece])
            end

            it 'sets @insufficient_material to true' do
                result = game.find_pieces
                expect(game.instance_variable_get(:@insufficient_material)).to be true
            end

            it 'returns true' do
                result = game.find_pieces
                expect(result).to be true
            end
        end

        context 'when there are kings and a bishop on both sides' do
            before do
                white_king_piece = ChessPiece::WHITE_KING
                black_king_piece = ChessPiece::BLACK_KING
                white_bishop_piece = ChessPiece::WHITE_BISHOP
                black_bishop_piece = ChessPiece::BLACK_BISHOP 
                game.instance_variable_set(:@white_pieces, [white_king_piece, white_king_piece, white_bishop_piece])
                game.instance_variable_set(:@black_pieces, [black_king_piece, black_king_piece, black_bishop_piece])
            end

            it 'sets @insufficient_material to true' do
                result = game.find_pieces
                expect(game.instance_variable_get(:@insufficient_material)).to be true
            end

            it 'returns true' do
                result = game.find_pieces
                expect(result).to be true
            end
        end

        context 'when there are other pieces asides kings, a bishop, or a knight on both sides' do
            before do
                white_king_piece = ChessPiece::WHITE_KING
                black_king_piece = ChessPiece::BLACK_KING
                white_bishop_piece = ChessPiece::WHITE_BISHOP
                black_bishop_piece = ChessPiece::BLACK_BISHOP 
                white_rook_piece = ChessPiece::WHITE_ROOK
                black_rook_piece = ChessPiece::BLACK_ROOK
                game.instance_variable_set(:@white_pieces, [white_king_piece, white_rook_piece, white_bishop_piece])
                game.instance_variable_set(:@black_pieces, [black_king_piece, black_rook_piece, black_bishop_piece])
            end

            it 'returns nil' do
                result = game.find_pieces
                expect(result).to be nil
            end
        end
    end

    describe '#legal_moves' do
        before do
            game.instance_variable_set(:@current_player, Player.new("Player2", "black"))
        end

        context 'when there are legal moves available' do
            it 'returns true' do
                game.instance_variable_set(:@black_pieces, [ChessPiece::BLACK_PAWN_6, ChessPiece::BLACK_KNIGHT])
                game.instance_variable_set(:@white_pieces, [ChessPiece::WHITE_PAWN_6, ChessPiece::WHITE_KNIGHT])
                allow(game).to receive(:pawn_movement).and_return([[1, 6]])
                allow(game).to receive(:knight_movement).and_return([[2, 5]])
                result = game.legal_moves
                expect(result).to be true
            end
        end

        context 'when there are no legal moves available' do
            it 'returns false' do
                game.instance_variable_set(:@black_pieces, [ChessPiece::BLACK_PAWN_6, ChessPiece::BLACK_KNIGHT])
                game.instance_variable_set(:@white_pieces, [ChessPiece::WHITE_PAWN_6, ChessPiece::WHITE_KNIGHT])
                allow(game).to receive(:pawn_movement)
                allow(game).to receive(:knight_movement)
                result = game.legal_moves
                expect(result).to be false
            end
        end
    end

    describe '#stalemate' do
        context 'when the game is in checkmate' do
            before do
                game.instance_variable_set(:@checkmate, true)
            end
      
            it 'returns false' do
                result = game.stalemate
                expect(result).to be false
            end
        end
      
        context 'when there are legal moves available' do
            before do
                allow(game).to receive(:legal_moves).and_return(true)
            end
      
            it 'returns false' do
                result = game.stalemate
                expect(result).to be false
            end
        end
      
        context 'when the player is in check' do
            before do
                game.instance_variable_set(:@in_check, true)
            end
      
            it 'returns false' do
                result = game.stalemate
                expect(result).to be false
            end
        end
      
        context 'when there are no legal moves and the player is not in check' do
            before do
                allow(game).to receive(:legal_moves).and_return(false)
                game.instance_variable_set(:@in_check, false)
            end
      
            it 'returns true' do
                result = game.stalemate
                expect(result).to be true
            end
        end

        context "when there's insufficient_material" do
            before do
                allow(game).to receive(:legal_moves)
                game.instance_variable_set(:@insufficient_material, true)
            end
      
            it 'returns true' do
                result = game.stalemate
                expect(result).to be true
            end
        end
    end

    describe '#update_board' do
        context 'when a piece moves to a new coordinate' do
            it 'updates the board correctly' do
                king_piece = ChessPiece::BLACK_KING
                king_piece.current_column = 0
                king_piece.current_row = 7

                white_bishop = ChessPiece::WHITE_BISHOP
                white_bishop.current_column = 7
                white_bishop.current_row = 0

                game.instance_variable_set(:@white_pieces, [white_bishop])
                game.instance_variable_set(:@black_pieces, [king_piece])

                game.instance_variable_set(:@board, [
                    [king_piece, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, white_bishop]
                ])

                updated_board = game.instance_variable_set(:@board, [
                    [nil, king_piece, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, white_bishop]
                ])

                game.update_board(0, 7, 1, 7)
                expect(game.instance_variable_get(:@board)).to eq(updated_board)
            end
        end
    end

end