class Player
    attr_reader :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end
end

class ChessPiece
    attr_accessor :name, :unicode, :start_column, :start_row, :current_column, :current_row, :color

    def initialize(name, unicode, start_column, start_row, current_column, current_row, color)
        @name = name
        @unicode = unicode
        @start_column = start_column
        @start_row = start_row
        @current_column = current_column
        @current_row = current_row
        @color = color
    end

    BLACK_PAWN_1 = ChessPiece.new("Black Pawn 1", "\u265F", 0, 6, 0, 6, 'black')
    BLACK_PAWN_2 = ChessPiece.new("Black Pawn 2", "\u265F", 1, 6, 1, 6, 'black')
    BLACK_PAWN_3 = ChessPiece.new("Black Pawn 3", "\u265F", 2, 6, 2, 6, 'black')
    BLACK_PAWN_4 = ChessPiece.new("Black Pawn 4", "\u265F", 3, 6, 3, 6, 'black')
    BLACK_PAWN_5 = ChessPiece.new("Black Pawn 5", "\u265F", 4, 6, 4, 6, 'black')
    BLACK_PAWN_6 = ChessPiece.new("Black Pawn 6", "\u265F", 5, 6, 5, 6, 'black')
    BLACK_PAWN_7 = ChessPiece.new("Black Pawn 7", "\u265F", 6, 6, 6, 6, 'black')
    BLACK_PAWN_8 = ChessPiece.new("Black Pawn 8", "\u265F", 7, 6, 7, 6, 'black')
    BLACK_KNIGHT_1 = ChessPiece.new("Black Knight 1", "\u265E", 1, 7, 1, 7, 'black')
    BLACK_KNIGHT_2 = ChessPiece.new("Black Knight 2", "\u265E", 6, 7, 6, 7, 'black')
    BLACK_BISHOP_1 = ChessPiece.new("Black Bishop 1", "\u265D", 2, 7, 2, 7, 'black')
    BLACK_BISHOP_2 = ChessPiece.new("Black Bishop 2", "\u265D", 5, 7, 5, 7, 'black')
    BLACK_ROOK_1 = ChessPiece.new("Black Rook 1", "\u265C", 0, 7, 0, 7, 'black')
    BLACK_ROOK_2 = ChessPiece.new("Black Rook 2", "\u265C", 7, 7, 7, 7, 'black')
    BLACK_KING = ChessPiece.new("Black King", "\u265A", 4, 7, 4, 7, 'black')
    BLACK_QUEEN = ChessPiece.new("Black Queen", "\u265B", 3, 7, 3, 7, 'black')

    WHITE_PAWN_1 = ChessPiece.new("White Pawn 1", "\u2659", 0, 1, 0, 1, 'white')
    WHITE_PAWN_2 = ChessPiece.new("White Pawn 2", "\u2659", 1, 1, 1, 1, 'white')
    WHITE_PAWN_3 = ChessPiece.new("White Pawn 3", "\u2659", 2, 1, 2, 1, 'white')
    WHITE_PAWN_4 = ChessPiece.new("White Pawn 4", "\u2659", 3, 1, 3, 1, 'white')
    WHITE_PAWN_5 = ChessPiece.new("White Pawn 5", "\u2659", 4, 1, 4, 1, 'white')
    WHITE_PAWN_6 = ChessPiece.new("White Pawn 6", "\u2659", 5, 1, 5, 1, 'white')
    WHITE_PAWN_7 = ChessPiece.new("White Pawn 7", "\u2659", 6, 1, 6, 1, 'white')
    WHITE_PAWN_8 = ChessPiece.new("White Pawn 8", "\u2659", 7, 1, 7, 1, 'white')
    WHITE_KNIGHT_1 = ChessPiece.new("White Knight 1", "\u2658", 1, 0, 1, 0, 'white')
    WHITE_KNIGHT_2 = ChessPiece.new("White Knight 2", "\u2658", 6, 0, 6, 0, 'white')
    WHITE_BISHOP_1 = ChessPiece.new("White Bishop 1", "\u2657", 2, 0, 2, 0, 'white')
    WHITE_BISHOP_2 = ChessPiece.new("White Bishop 2", "\u2657", 5, 0, 5, 0, 'white')
    WHITE_ROOK_1 = ChessPiece.new("White Rook 1", "\u2656", 0, 0, 0, 0, 'white')
    WHITE_ROOK_2 = ChessPiece.new("White Rook 2", "\u2656", 7, 0, 7, 0, 'white')
    WHITE_QUEEN = ChessPiece.new("White Queen", "\u2655", 3, 0, 3, 0, 'white')
    WHITE_KING = ChessPiece.new("White King", "\u2654", 4, 0, 4, 0, 'white')
end

class ChessBoard < ChessPiece
    attr_accessor :board

    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
        @black_pawn_1 = ChessPiece::BLACK_PAWN_1
        @black_pawn_2 = ChessPiece::BLACK_PAWN_2
        @black_pawn_3 = ChessPiece::BLACK_PAWN_3
        @black_pawn_4 = ChessPiece::BLACK_PAWN_4
        @black_pawn_5 = ChessPiece::BLACK_PAWN_5
        @black_pawn_6 = ChessPiece::BLACK_PAWN_6
        @black_pawn_7 = ChessPiece::BLACK_PAWN_7
        @black_pawn_8 = ChessPiece::BLACK_PAWN_8
        @black_knight_1 = ChessPiece::BLACK_KNIGHT_1
        @black_bishop_1 = ChessPiece::BLACK_BISHOP_1
        @black_rook_1 = ChessPiece::BLACK_ROOK_1
        @black_knight_2 = ChessPiece::BLACK_KNIGHT_2
        @black_bishop_2 = ChessPiece::BLACK_BISHOP_2
        @black_rook_2 = ChessPiece::BLACK_ROOK_2
        @black_king = ChessPiece::BLACK_KING
        @black_queen = ChessPiece::BLACK_QUEEN

        @white_pawn_1 = ChessPiece::WHITE_PAWN_1
        @white_pawn_2 = ChessPiece::WHITE_PAWN_2
        @white_pawn_3 = ChessPiece::WHITE_PAWN_3
        @white_pawn_4 = ChessPiece::WHITE_PAWN_4
        @white_pawn_5 = ChessPiece::WHITE_PAWN_5
        @white_pawn_6 = ChessPiece::WHITE_PAWN_6
        @white_pawn_7 = ChessPiece::WHITE_PAWN_7
        @white_pawn_8 = ChessPiece::WHITE_PAWN_8
        @white_knight_1 = ChessPiece::WHITE_KNIGHT_1
        @white_bishop_1 = ChessPiece::WHITE_BISHOP_1
        @white_rook_1= ChessPiece::WHITE_ROOK_1
        @white_knight_2 = ChessPiece::WHITE_KNIGHT_2
        @white_bishop_2 = ChessPiece::WHITE_BISHOP_2
        @white_rook_2= ChessPiece::WHITE_ROOK_2
        @white_king = ChessPiece::WHITE_KING
        @white_queen = ChessPiece::WHITE_QUEEN
    end

    def setup_board
        setup_pieces(:white)
        setup_pieces(:black)
    end

    def seperator
        "--+-------+-------+-------+-------+-------+-------+-------+-------+"
    end

    def numbers
        "      0       1       2       3       4       5       6       7"
    end

    def display_board
        puts numbers
        puts seperator
        puts "7 |   #{@black_rook_1.unicode}   |   #{@black_knight_1.unicode}   |   #{@black_bishop_1.unicode}   |   #{@black_queen.unicode}   |   #{@black_king.unicode}   |   #{@black_bishop_2.unicode}   |   #{@black_knight_2.unicode}   |   #{@black_rook_2.unicode}   |"
        puts seperator
        puts "6 |   #{@black_pawn_1.unicode}   |   #{@black_pawn_2.unicode}   |   #{@black_pawn_3.unicode}   |   #{@black_pawn_4.unicode}   |   #{@black_pawn_5.unicode}   |   #{@black_pawn_6.unicode}   |   #{@black_pawn_7.unicode}   |   #{@black_pawn_8.unicode}   |"
        puts seperator
        puts "5 |  #{"0, 5"} |  #{"1, 5"} |  #{"2, 5"} |  #{"3, 5"} |  #{"4, 5"} |  #{"5, 5"} |  #{"6, 5"} |  #{"7, 5"} |"
        puts seperator
        puts "4 |  #{"0, 4"} |  #{"1, 4"} |  #{"2, 4"} |  #{"3, 4"} |  #{"4, 4"} |  #{"5, 4"} |  #{"6, 4"} |  #{"7, 4"} |"
        puts seperator
        puts "3 |  #{"0, 3"} |  #{"1, 3"} |  #{"2, 4"} |  #{"3, 3"} |  #{"4, 3"} |  #{"5, 3"} |  #{"6, 3"} |  #{"7, 3"} |"
        puts seperator
        puts "2 |  #{"0, 2"} |  #{"1, 2"} |  #{"2, 4"} |  #{"3, 2"} |  #{"4, 2"} |  #{"5, 2"} |  #{"6, 2"} |  #{"7, 2"} |"
        puts seperator
        puts "1 |   #{@white_pawn_1.unicode}   |   #{@white_pawn_2.unicode}   |   #{@white_pawn_3.unicode}   |   #{@white_pawn_4.unicode}   |   #{@white_pawn_5.unicode}   |   #{@white_pawn_6.unicode}   |   #{@white_pawn_7.unicode}   |   #{@white_pawn_8.unicode}   |"
        puts seperator
        puts "0 |   #{@white_rook_1.unicode}   |   #{@white_knight_1.unicode}   |   #{@white_bishop_1.unicode}   |   #{@white_queen.unicode}   |   #{@white_king.unicode}   |   #{@white_bishop_2.unicode}   |   #{@white_knight_2.unicode}   |   #{@white_rook_2.unicode}   |"
        puts seperator
        puts "\n"
    end

    def label_at(index)
        "#{('a'.ord + (index % 8)).chr}#{8 - (index / 8)}"
    end

    private

    def setup_pieces(color)
        major_pieces = color == :white ? 7 : 0
        pawns = color == :white ? 6 : 1

        @board[major_pieces] = (
            color == :white ? ["\u2656", "\u2658", "\u2657", "\u2655", "\u2654", "\u2657", "\u2658", "\u2656"] :
                             ["\u265C", "\u265E", "\u265D", "\u265B", "\u265A", "\u265D", "\u265E", "\u265C"]
        )

        @board[pawns] = Array.new(8, color == :white ? "\u2659" : "\u265F")
    end
end

class ChessGame < ChessPiece
    attr_accessor :chessboard, :board, :player_one_pieces, :player_two_pieces, :black_pawns, :white_pawns
    def initialize
        @chessboard = ChessBoard.new
        @board = @chessboard.board
        @current_player = ''
        @pieces_captured_by_player_one = 0
        @player_one_pieces_remaining = 16
        @pieces_captured_by_player_two = 0
        @player_two_pieces_remaining = 16
        @white_pawns = [ChessPiece::WHITE_PAWN_1, ChessPiece::WHITE_PAWN_2, ChessPiece::WHITE_PAWN_3, ChessPiece::WHITE_PAWN_4, ChessPiece::WHITE_PAWN_5, ChessPiece::WHITE_PAWN_6, ChessPiece::WHITE_PAWN_7, ChessPiece::WHITE_PAWN_8]
        @black_pawns = [ChessPiece::BLACK_PAWN_1, ChessPiece::BLACK_PAWN_2, ChessPiece::BLACK_PAWN_3, ChessPiece::BLACK_PAWN_4, ChessPiece::BLACK_PAWN_5, ChessPiece::BLACK_PAWN_6, ChessPiece::BLACK_PAWN_7, ChessPiece::BLACK_PAWN_8]
        @black_pieces = [@black_pawns, ChessPiece::BLACK_KNIGHT_1, ChessPiece::BLACK_KNIGHT_2, ChessPiece::BLACK_BISHOP_1, ChessPiece::BLACK_BISHOP_2, ChessPiece::BLACK_ROOK_1, ChessPiece::BLACK_ROOK_2, ChessPiece::BLACK_KING, ChessPiece::BLACK_QUEEN]
        @white_pieces = [@white_pawns, ChessPiece::WHITE_KNIGHT_1, ChessPiece::WHITE_KNIGHT_2, ChessPiece::WHITE_BISHOP_1, ChessPiece::WHITE_BISHOP_2, ChessPiece::WHITE_ROOK_1, ChessPiece::WHITE_ROOK_2, ChessPiece::WHITE_KING, ChessPiece::WHITE_QUEEN]
        @major_black_pieces = [ChessPiece::BLACK_KNIGHT_1, ChessPiece::BLACK_KNIGHT_2, ChessPiece::BLACK_BISHOP_1, ChessPiece::BLACK_BISHOP_2, ChessPiece::BLACK_ROOK_1, ChessPiece::BLACK_ROOK_2, ChessPiece::BLACK_KING, ChessPiece::BLACK_QUEEN]
        @major_white_pieces = [ChessPiece::WHITE_KNIGHT_1, ChessPiece::WHITE_KNIGHT_2, ChessPiece::WHITE_BISHOP_1, ChessPiece::WHITE_BISHOP_2, ChessPiece::WHITE_ROOK_1, ChessPiece::WHITE_ROOK_2, ChessPiece::WHITE_KING, ChessPiece::WHITE_QUEEN]
        @player_one = ''
        @player_two = ''
        @player_one_name = ''
        @player_two_name = ''
        @player_one_king = 'White King'
        @player_two_king = 'Black King'
        @player_one_rook_1 = "White Rook 1"
        @player_one_rook_2 = "White Rook 2"
        @player_two_rook_1 = "Black Rook 1"
        @player_two_rook_2 = "Black Rook 2"
        @player_one_color = 'white'
        @player_two_color = 'black'
        @player_one_pieces = @white_pieces
        @player_two_pieces = @black_pieces
        @player_one_pieces = nil
        @player_two_pieces = nil
        @left_king_castling_column = nil
        @right_king_castling_column = nil
        @left_king_castling_move = []
        @right_king_castling_move = []
        @rook_1_castling_column = nil
        @rook_1_castling_move = []
        @rook_2_castling_column = nil
        @rook_2_castling_move = []
        @player_one_double_move_made = false
        @player_two_double_move_made = false
        @player_one_double_move_pawn = nil
        @player_two_double_move_pawn = nil
        @en_passant_possible = false
        @en_passant_move = []
        @en_passant_piece = nil
        @captured_en_passant = false
        @in_check = false
        @checkmate = false
        @king_moved = false
        @rook_moved = false
        @square_under_attack = false
        @insufficient_material = false
        @castling_attempted = true
        @castling_possible = false
    end

    def setup_board
        @board

        setup_pieces(@major_black_pieces)
        setup_pieces(@major_white_pieces)
        setup_pieces(@white_pawns)
        setup_pieces(@black_pawns)

        @board
    end

    def setup_board_2
        @board

        dummy_white_pieces = [ChessPiece::WHITE_ROOK_1, ChessPiece::WHITE_ROOK_2, ChessPiece::WHITE_KING, ChessPiece::WHITE_QUEEN]
        setup_pieces(@major_black_pieces)
        setup_pieces(dummy_white_pieces)
        setup_pieces(@black_pawns)

        @board
    end

    def setup_pieces(pieces)
        pieces.each do |piece|
            if piece.start_column && piece.start_row #&& piece.current_column && piece.current_row
                column = piece.start_column
                row = piece.start_row
                @board[row][column] = piece
            end
        end
    end

    def scan_board
        @player_one_pieces = []
        @player_two_pieces = []
      
        @board.each do |row|
            row.each do |piece|
            next if piece.nil?
      
            if piece.color == 'white' && piece.start_column && piece.start_row && piece.current_column && piece.current_row
                @player_one_pieces << piece
            elsif piece.color == 'black' && piece.start_column && piece.start_row && piece.current_column && piece.current_row
                @player_two_pieces << piece
            end
          end
        end
    end
      
    def seperator
        "--+-------+-------+-------+-------+-------+-------+-------+-------+"
    end

    def numbers
        "      0       1       2       3       4       5       6       7"
    end

    def display_updated_board
        puts numbers
        puts seperator
        
        7.downto(0) do |row|
          print "#{row} |"
          
          0.upto(7) do |col|
            piece = get_piece_at(col, row)
            if piece
                print "   #{piece.unicode}   |"
            else
                print "  #{col}, #{row} |"
            end
          end
          
          puts "\n--+-------+-------+-------+-------+-------+-------+-------+-------+"
        end
    end
    
    def pawn_movement(column, row)
        pawn_moves = []

        piece = get_piece_at(column, row)

        if piece.color == @player_one_color
            direction = 1
            regular_move = [column, row + direction]
            pawn_moves << regular_move if pawn_valid_move?(regular_move)

            # Double move on the first turn
            double_move = [column, row + 2 * direction]

            if row == 1 && pawn_valid_move?(double_move)
                pawn_moves << double_move
                @player_one_double_move_made = true
                @player_one_double_move_pawn = piece.name
            end

        elsif piece.color == @player_two_color
            direction = -1
            regular_move = [column, row + direction]
            pawn_moves << regular_move if pawn_valid_move?(regular_move)

            # Double move on the first turn
            double_move = [column, row + 2 * direction]

            if row == 6 && pawn_valid_move?(double_move)
                pawn_moves << double_move
                @player_two_double_move_made = true
                @player_two_double_move_pawn = piece.name
            end
        end

        pawn_moves
    end

    def pawn_valid_move?(move)
        move.all? { |coord| coord.between?(0, 7) }
    end

    def rook_movement(start_column, start_row)
        rook_moves = []

        # horizontal moves
        (0..7).each do |column|
            rook_moves << [column, start_row] unless  column == start_column
        end

        # vertical moves
        (0..7).each do |row|
            rook_moves << [start_column, row] unless  row == start_row
        end

        rook_moves
    end

    def bishop_movement(column, row)
        bishop_moves = []

        directions = [
            [1, 1], [-1, 1], [1, -1], [-1, -1],
            [1, 0], [-1, 0], [0, 1], [0, -1]
        ]

        directions.each do |direction|
            column_change, row_change = direction
            new_column, new_row = column, row

            loop do
                new_column += column_change
                new_row += row_change

                break unless new_column.between?(0, 7) && new_row.between?(0, 7)

                bishop_moves << [new_column, new_row]
            end
        end

        bishop_moves
    end
    
    def knight_movement(column, row)
        valid_knight_moves = [
            [1, 2], [2, 1],
            [-1, 2], [-2, 1],
            [1, -2], [2, -1],
            [-1, -2], [-2, -1]  
        ]

        knight_moves = []

        valid_knight_moves.each do |move|
            column_change, row_change = move
            new_column, new_row = column + column_change, row + row_change

            if new_column.between?(0, 7) && new_row.between?(0, 7)
                knight_moves << [new_column, new_row]
            end
        end

        knight_moves
    end

    def king_movement(column, row)
        king_moves = []

        directions = [
            [1, 0], [-1, 0], [0, 1], [0, -1],
            [1, 1], [-1, 1], [1, -1], [-1, -1]
        ]

        directions.each do |direction|
            column_change, row_change = direction
            new_column, new_row = column + column_change, row + row_change

            if new_column.between?(0, 7) && new_row.between?(0, 7)
                king_moves << [new_column, new_row]
            end
        end

        king_moves
    end

    def queen_movement(column, row)
        queen_moves = []

        rook_result = rook_movement(column, row)
        bishop_result = bishop_movement(column, row)

        queen_moves = rook_result | bishop_result
    end

    def capture_piece(current_column, current_row, destination_column, destination_row)
        opponent_pieces = @current_player == @player_one ? @player_two_pieces : @player_one_pieces
        opponent_piece = opponent_pieces.find { |piece| piece.current_column == destination_column && piece.current_row == destination_row }
        
        if opponent_piece
            opponent_pieces.delete(opponent_piece)
            puts "#{@current_player}'s pawn captured #{@current_player}'s #{opponent_piece.name} at #{opponent_piece.current_column}, #{opponent_piece.current_row}"
    
            if @current_player == @player_one
                @pieces_captured_by_player_one += 1
                @player_two_pieces_remaining -= 1
            else
                @pieces_captured_by_player_two += 1
                @player_one_pieces_remaining -= 1
            end

            replace_piece(opponent_piece, piece) unless ENV['SKIP_REPLACE_PIECE'] 
        end
    end

    def retrieve_pawn(current_column, current_row)
        pawn = get_piece_at(current_column, current_row)

        if pawn&.name&.match?(/Pawn/i)
            true
        else
            false
        end

        pawn
    end

    def en_passant_possible?(current_column, current_row)
        if @current_player == @player_one && @player_two_double_move_made == true
            pawn_piece = retrieve_pawn(current_column, current_row)

            if pawn_piece
                fifth_rank = 4

                if pawn_piece.current_row == fifth_rank
                    @en_passant_possible = true
                    puts "en passant is possible"
                    return true
                end
            end

        elsif @current_player == @player_two && @player_one_double_move_made == true
            pawn_piece = retrieve_pawn(current_column, current_row)

            if pawn_piece
                fifth_rank = 3

                if pawn_piece.current_row == fifth_rank
                    @en_passant_possible = true
                    puts "en passant is possible"
                    return true
                end
            end
        end

        puts "en passant is not possible"
        false
    end
       
    def en_passant_capture(en_passant_piece)
        if @current_player == @player_one && @player_two_double_move_made == true && @en_passant_possible == true && @en_passant_attempted == true

            @player_two_pieces.delete(en_passant_piece)
            opponent_piece = find_piece_on_board(@player_two_double_move_pawn)

            if opponent_piece
                @board[opponent_piece.current_row][opponent_piece.current_column] = nil
            end

            @pieces_captured_by_player_one += 1
            @player_two_pieces_remaining -= 1
            puts "#{@player_one_name}'s pawn captured #{@player_two_name}'s #{en_passant_piece.name} en passant at #{en_passant_piece.current_column}, #{en_passant_piece.current_row}"

        elsif @current_player == @player_two && @player_one_double_move_made == true && @en_passant_possible == true && @en_passant_attempted == true
            
            @player_one_pieces.delete(en_passant_piece)
            opponent_piece = find_piece_on_board(@player_two_double_move_pawn)

            if opponent_piece
                @board[opponent_piece.current_row][opponent_piece.current_column] = nil
            end

            @pieces_captured_by_player_two += 1
            @player_one_pieces_remaining -= 1
            puts "#{@player_two_name}'s pawn captured #{@player_one_name}'s #{en_passant_piece.name} en passant at #{en_passant_piece.current_column}, #{en_passant_piece.current_row}"
        end
    end

    def retrieve_en_passant_destination
        if @current_player == @player_one
            if @en_passant_possible == true
                opponent_pieces = @player_two_pieces
                opponent_piece = nil
    
                @board.each_with_index do |row, r|
                    row.each_with_index do |col, c|
                        next if col.nil? || col.name != @player_two_double_move_pawn
            
                        opponent_piece = col
                        break
                    end
                    break if opponent_piece
                end
    
                @en_passant_piece = opponent_piece
                en_passant_piece = @en_passant_piece
    
                puts "opponent piece = #{opponent_piece} "
    
                if opponent_piece
                    @en_passant_attempted = true
                    @en_passant_move << [opponent_piece.current_column, opponent_piece.current_row + 1]
                    en_passant_capture(en_passant_piece)
                end
    
                valid_moves << @en_passant_move
                @captured_en_passant = true
            end
        elsif @current_player == @player_two
            if @en_passant_possible == true
                opponent_pieces = @player_one_pieces
                opponent_piece = nil
    
                @board.each_with_index do |row, r|
                    row.each_with_index do |col, c|
                        next if col.nil? || col.name != @player_one_double_move_pawn
            
                        opponent_piece = col
                        break
                    end
                    break if opponent_piece
                end
    
                @en_passant_piece = opponent_piece
                en_passant_piece = @en_passant_piece
    
                puts "opponent piece = #{opponent_piece} "
    
                if opponent_piece
                    @en_passant_attempted = true
                    @en_passant_move << [opponent_piece.current_column, opponent_piece.current_row + 1]
                    en_passant_capture(en_passant_piece)
                end
    
                valid_moves << @en_passant_move
                @captured_en_passant = true
            end
        end
    end

    def reset_en_passant_variables
        @en_passant_possible = false
        @en_passant_attempted = false
        @en_passant_move = []
        @en_passant_piece = nil
        @player_one_double_move_made = false
        @player_one_double_move_pawn = nil
        @player_two_double_move_made = false
        @player_two_double_move_pawn = nil
        @captured_en_passant = false
    end
                    
    def get_piece_at(column, row)
        piece = @board[row][column]

        return piece if piece
      
        nil
    end

    # Add a helper method to find a piece on the board by name
    def find_piece_on_board(piece_name)
        @board.each do |row|
            row.each do |piece|
                return piece if piece && piece.name == piece_name && piece.current_column && piece.current_row
            end
        end
        nil
    end

    def move_piece(new_column, new_row, old_column, old_row)
        if @current_player == @player_one
            piece = get_piece_at(old_column, old_row)
            return unless piece

            if piece.color == @player_one_color
                valid_moves = case piece.name
                when /pawn/i
                    pawn_movement(old_column, old_row)
                when /king/i
                    king_movement(old_column, old_row)
                when /knight/i
                    knight_movement(old_column, old_row)
                when /bishop/i
                    bishop_movement(old_column, old_row)
                when /rook/i
                    rook_movement(old_column, old_row)
                when /queen/i
                    queen_movement(old_column, old_row)
                end

                en_passant_possible?(old_column, old_row)
                castling_possible?

                if @en_passant_possible == true
                    opponent_piece = nil
        
                    @board.each_with_index do |row, r|
                        row.each_with_index do |col, c|
                            next if col.nil? || col.name != @player_two_double_move_pawn
                
                            opponent_piece = col
                            break
                        end
                        break if opponent_piece
                    end
        
                    @en_passant_piece = opponent_piece
                    en_passant_piece = @en_passant_piece
        
                    puts "opponent piece = #{opponent_piece} "
        
                    if opponent_piece
                        @en_passant_attempted = true
                        @en_passant_move << [opponent_piece.current_column, opponent_piece.current_row + 1]
                        en_passant_capture(en_passant_piece)
                    end
        
                    valid_moves << @en_passant_move
                    @captured_en_passant = true
                end

                if @castling_possible == true
                    #king = find_piece_on_board(@player_one_king)
                    #rook_1 = find_piece_on_board(@player_one_rook_1)
                    #rook_2 = find_piece_on_board(@player_one_rook_2)

                    king = nil
                    rook_1 = nil
                    rook_2 = nil
        
        
                    @board.each_with_index do |row, r|
                        row.each_with_index do |col, c|
                            next if col.nil? || col.name != @player_one_king
                
                            king = col
                            break
                        end
                        break if king
                    end

                    @board.each_with_index do |row, r|
                        row.each_with_index do |col, c|
                            next if col.nil? || col.name != @player_one_rook_1
                
                            rook_1 = col
                            break
                        end
                        break if rook_1
                    end

                    @board.each_with_index do |row, r|
                        row.each_with_index do |col, c|
                            next if col.nil? || col.name != @player_one_rook_2
                
                            rook_2 = col
                            break
                        end
                        break if rook_2
                    end
        
                    
                    puts "king piece = #{king.name} "
                    puts "king current column = #{king.current_column} "
                    puts "rook 1 piece = #{rook_1.name} "
                    puts "rook 2 piece = #{rook_2.name} "
        
                    if king
                        @left_king_castling_column = king.current_column - 2
                        @right_king_castling_column = king.current_column + 2
                        @left_king_castling_move << [@left_king_castling_column, king.current_row]
                        @right_king_castling_move << [@right_king_castling_column, king.current_row]
                    end

                    if rook_1
                        @rook_1_castling_column = rook_1.current_column + 3 
                        @rook_1_castling_move << [@rook_1_castling_column, rook_1.current_row]
                    end

                    if rook_2
                        @rook_2_castling_column = rook_2.current_column - 2
                        @rook_2_castling_move << [@rook_2_castling_column, rook_2.current_row]
                    end

                    valid_moves << @left_king_castling_move
                    valid_moves << @right_king_castling_move
                    valid_moves

                    puts "left_king_castling_column = #{@left_king_castling_column} "
                    puts "right_king_castling_column = #{@right_king_castling_column} "
                    puts "left_king_castling_move = #{@left_king_castling_move} "
                    puts "right_king_castling_move = #{@right_king_castling_move} "

                    puts "rook_1_castling_column = #{@rook_1_castling_column} "
                    puts "rook_1_castling_move = #{@rook_1_castling_move} "
                    puts "rook_2_castling_column = #{@rook_2_castling_column} "
                    puts "rook_2_castling_move = #{@rook_2_castling_move} "
                end
    
                puts "#{valid_moves}"

                castling_attempted?(new_column, new_row, old_column, old_row)
    
                if valid_moves.include?([new_column, new_row]) && @en_passant_possible == false
                    piece.current_column = new_column
                    piece.current_row = new_row
                    puts "Moved #{piece.name} to column #{new_column}, row #{new_row}"

                    if piece&.name&.match?(/King/i)
                        @king_moved = true
                    elsif piece&.name&.match?(/Rook/i)
                        @rook_moved = true
                    end

                    update_board(piece.current_column, piece.current_row, old_column, old_row)

                elsif @en_passant_attempted == true && @castling_possible == false
                    piece.current_column = opponent_piece.current_column
                    piece.current_row = opponent_piece.current_row + 1
                    update_board(piece.current_column, piece.current_row, old_column, old_row)
                    puts "Moved #{piece.name} to column #{new_column}, row #{new_row} via en passant"
                    puts "en passant move is #{@en_passant_move}"
                    display_updated_board

                    if @captured_en_passant == true
                        reset_en_passant_variables
                    end

                    switch_players

                elsif valid_moves.include?(@left_king_castling_move)
                    piece.current_column = new_column
                    piece.current_row = new_row
                    puts "Moved #{piece.name} to column #{new_column}, row #{new_row}"

                    update_board(piece.current_column, piece.current_row, old_column, old_row)
    
                    if piece.current_column == @left_king_castling_column
                        rook_1.current_column = @rook_1_castling_column
                        rook_1.current_row = rook_1.current_row
                        update_board(rook_1.current_column, 0, 0, 0)
    
                    elsif piece.current_column == @right_king_castling_column
                        rook_2.current_column = @rook_2_castling_column
                        rook_2.current_row = rook_2.current_row
                        update_board(rook_2.current_column, rook_2.current_row, old_column, old_row)
                    end
    
                    @king_moved = true
                    @rook_moved = true
    
                    
                    display_updated_board
                    switch_players

                else
                    illegal_move
                end
            else
                puts "Illegal selection, select a white piece!"
            end
        elsif @current_player == @player_two
            piece = get_piece_at(old_column, old_row)
            return unless piece

            if piece.color == @player_two_color
                valid_moves = case piece.name
                when /pawn/i
                    pawn_movement(old_column, old_row)
                when /king/i
                    king_movement(old_column, old_row)
                when /knight/i
                    knight_movement(old_column, old_row)
                when /bishop/i
                    bishop_movement(old_column, old_row)
                when /rook/i
                    rook_movement(old_column, old_row)
                when /queen/i
                    queen_movement(old_column, old_row)
                end

                en_passant_possible?(old_column, old_row)
                castling_possible?

                if @en_passant_possible == true
                    opponent_pieces = @player_one_pieces
                    opponent_piece = nil
        
                    @board.each_with_index do |row, r|
                        row.each_with_index do |col, c|
                            next if col.nil? || col.name != @player_one_double_move_pawn
                
                            opponent_piece = col
                            break
                        end
                        break if opponent_piece
                    end
        
                    @en_passant_piece = opponent_piece
                    en_passant_piece = @en_passant_piece
        
                    puts "opponent piece = #{opponent_piece} "
        
                    if opponent_piece
                        @en_passant_attempted = true
                        @en_passant_move << [opponent_piece.current_column, opponent_piece.current_row + 1]
                        en_passant_capture(en_passant_piece)
                    end
        
                    valid_moves << @en_passant_move
                    @captured_en_passant = true
                end

                puts "#{valid_moves}"
    
                if valid_moves.include?([new_column, new_row]) && @en_passant_possible == false
                    #capture_piece(old_column, old_row, new_column, new_row) unless ENV['SKIP_CAPTURE_PIECE'] 
                    piece.current_column = new_column
                    piece.current_row = new_row
                    puts "Moved #{piece.name} to column #{new_column}, row #{new_row}"

                    if piece&.name&.match?(/King/i)
                        @king_moved = true
                    elsif piece&.name&.match?(/Rook/i)
                        @rook_moved = true
                    end

                    update_board(piece.current_column, piece.current_row, old_column, old_row)
                    
                elsif @en_passant_attempted == true
                    piece.current_column = opponent_piece.current_column
                    piece.current_row = opponent_piece.current_row + 1
                    update_board(piece.current_column, piece.current_row, old_column, old_row)
                    puts "Moved #{piece.name} to column #{new_column}, row #{new_row} via en passant"
                    puts "en passant move is #{@en_passant_move}"
                    display_updated_board

                    if @captured_en_passant == true
                        reset_en_passant_variables
                    end

                    switch_players
                else
                    illegal_move
                end
            else
                puts "Illegal selection, select a black piece!"
            end
        end
    end

    def castling_possible?
        return false if @king_moved == true || @rook_moved == true

        if @current_player == @player_one
            # Determine the column of the king and rook based on the color
            king_column = 4
            rook_1_column = 0
            rook_2_column = 7

            rook_1_column_plus_one = get_piece_at(rook_1_column + 1, 0)
            rook_1_column_plus_two = get_piece_at(rook_1_column + 2, 0)
            rook_1_column_plus_three = get_piece_at(rook_1_column + 3, 0)

            rook_2_column_minus_one = get_piece_at(rook_2_column - 1, 0)
            rook_2_column_minus_two = get_piece_at(rook_2_column - 2, 0)

            # Check if the king and rook are present at their starting positions
            return false unless get_piece_at(king_column, 0)&.name == "White King"

            rook_piece_1 = get_piece_at(rook_1_column, 0)
            rook_piece_2 = get_piece_at(rook_2_column, 0)

            return false unless rook_piece_1&.name == "White Rook 1" 
            return false unless rook_piece_2&.name == "White Rook 2"

            if rook_1_column_plus_one.nil? && rook_1_column_plus_two.nil? && rook_1_column_plus_three.nil? && rook_2_column_minus_one.nil? && rook_2_column_minus_two.nil?
                return false
            end
             
            @castling_possible = true
            puts "Castling is possible"
            return true

        elsif @current_player == @player_two
            # Determine the column of the king and rook based on the color
            king_column = 4
            rook_1_column = 0
            rook_2_column = 7

            rook_1_column_plus_one = get_piece_at(rook_1_column + 1, 7)
            rook_1_column_plus_two = get_piece_at(rook_1_column + 2, 7)
            rook_1_column_plus_three = get_piece_at(rook_1_column + 3, 7)

            rook_2_column_minus_one = get_piece_at(rook_2_column - 1, 7)
            rook_2_column_minus_two = get_piece_at(rook_2_column - 2, 7)

            # Check if the king and rook are present at their starting positions
            return false unless get_piece_at(king_column, 7)&.name == "Black King"
            
            rook_piece_1 = get_piece_at(rook_1_column, 7)
            rook_piece_2 = get_piece_at(rook_2_column, 7)

            return false unless rook_piece_1&.name == "Black Rook 1" 
            return false unless rook_piece_2&.name == "Black Rook 2"

            # Check that the squares between the king and rook are unoccupied
            if rook_1_column_plus_one.nil? && rook_1_column_plus_two.nil? && rook_1_column_plus_three.nil? && rook_2_column_minus_one.nil? && rook_2_column_minus_two.nil?
                return false
            end

            @castling_possible = true
            puts "Castling is possible"
            return true
        end
    end

    def castling_attempted?(destination_column, destination_row, current_column, current_row)
        if @current_player == @player_one
            piece = get_piece_at(current_column, current_row)
            return false unless piece&.name&.match?(/King/i)
      
            rook_column = 0
            rook_row = 0 
      
            return false unless destination_row == rook_row && destination_column == rook_column + 2
      
            @castling_attempted = true
            true

        elsif @current_player == @player_two
            piece = get_piece_at(current_column, current_row)
            return false unless piece&.name&.match?(/King/i)
      
            rook_column = 0
            rook_row = 0 
      
            return false unless destination_row == rook_row && destination_column == rook_column + 2
      
            @castling_attempted = true
            puts "castling has been attempted"
            true
        end
    end

    def castling
        return unless @castling_possible == true && @castling_attempted == true

        # Assuming castling is valid and already checked
        king_column = (@current_player == @player_one) ? 4 : 3
        rook_column = (@current_player == @player_one) ? 7 : 0
      
        if rook_column == 7
          # Kingside castling for white
          move_piece(6, 0, king_column, 0) # Move the king to the new position
          move_piece(5, 0, rook_column, 0) # Move the rook to the new position
        else
          # Queenside castling for black
          move_piece(2, 0, king_column, 0) # Move the king to the new position
          move_piece(3, 0, rook_column, 0) # Move the rook to the new position
        end
      
        # Mark the king and rook as moved
        @king_moved = true
        @rook_moved = true
    end

    def replace_piece(old_piece, new_piece)
        @board.each do |row|
          row.map! { |piece| piece == old_piece ? new_piece : piece }
        end
    end

    def pawn_promotion(current_column, current_row)
        if @current_player == @player_one 
            pawn = retrieve_pawn(current_column, current_row)
            
            return unless @player_one_pieces.include?(pawn) && current_row == 7

            piece_color = @player_one_color

            puts "#{@player_one_name}, choose the piece for pawn promotion (queen, king, rook, bishop, knight):"
            piece_choice = gets.chomp.downcase

            until ['queen', 'king', 'rook', 'bishop', 'knight'].include?(piece_choice)
                puts "Invalid piece choice for promotion."
                return
            end

            new_piece = case piece_choice
        
            when 'king'
                ChessPiece.new("White King 3", "\u2654", pawn.start_column, pawn.start_row, current_column, current_row, @player_one_color)
            when 'queen'
                ChessPiece.new("White Queen 3", "\u2655", pawn.start_column, pawn.start_row, current_column, current_row, @player_one_color)
            when 'rook'
                ChessPiece.new("White Rook 3", "\u2656", pawn.start_column, pawn.start_row, current_column, current_row, @player_one_color)
            when 'bishop'
                ChessPiece.new("White Bishop 3", "\u2657", pawn.start_column, pawn.start_row, current_column, current_row, @player_one_color)
            when 'knight'
                ChessPiece.new("White Knight 3", "\u2658", pawn.start_column, pawn.start_row, current_column, current_row, @player_one_color)
            end

            replace_piece(pawn, new_piece)
            puts "#{@player_one_name} promotes a pawn to a #{piece_choice.capitalize} at #{current_column}, #{current_row}."
            new_piece

        elsif @current_player == @player_two
            pawn = get_piece_at(column, row)
            
            return unless @player_two_pieces.include?(pawn) &&  pawn&.name&.match?(/Pawn/i) && row == 0

            piece_color = @player_two_color

            puts "#{@player_two_name}, choose the piece for pawn promotion (queen, king, rook, bishop, knight):"
            piece_choice = gets.chomp.downcase

            until ['queen', 'king', 'rook', 'bishop', 'knight'].include?(piece_choice)
                puts "Invalid piece choice for promotion."
                return
            end

            new_piece = case piece_choice
            when 'king'
                ChessPiece.new("Black King 3", "\u265A", pawn.start_column, pawn.start_row, current_column, current_row, @player_two_color)
            when 'queen'
                ChessPiece.new("Black Queen", "\u265B", pawn.start_column, pawn.start_row, current_column, current_row, @player_two_color)
            when 'rook'
                ChessPiece.new("Black Rook", "\u265C", pawn.start_column, pawn.start_row, current_column, current_row, @player_two_color)
            when 'bishop'
                ChessPiece.new("Black Bishop", "\u265D", pawn.start_column, pawn.start_row, current_column, current_row, @player_two_color)
            when 'knight'
                ChessPiece.new("Black Knight", "\u265E", pawn.start_column, pawn.start_row, current_column, current_row, @player_two_color)
            end

            replace_piece(pawn, new_piece)
            puts "#{@player_two_name} promotes a pawn to a #{piece_choice.capitalize} at #{current_column}, #{current_row}."
            new_piece
        end
    end

    def king_in_check?
        king_piece = @current_player == @player_one ? ChessPiece::WHITE_KING : ChessPiece::BLACK_KING
        opponent_pieces = @current_player == @player_one ? @player_two_pieces : @player_one_pieces

        opponent_pieces.each do |piece|
            possible_moves =
            
            case piece.name
            when /pawn/i
                pawn_movement(piece.current_column, piece.current_row)
            when /rook/i
                rook_movement(piece.current_column, piece.current_row)
            when /bishop/i
                bishop_movement(piece.current_column, piece.current_row)
            when /knight/i
                knight_movement(piece.current_column, piece.current_row)
            when /queen/i
                queen_movement(piece.current_column, piece.current_row)
            when /king/i
                king_movement(piece.current_column, piece.current_row)
            end

            if possible_moves.include?([king_piece.current_column, king_piece.current_row])
                @in_check = true
                return true
            end
        end

        false
    end

    def checkmate?
        return false unless @in_check == true

        player_pieces = (@current_player == @player_one) ? @player_one_pieces : @player_two_pieces
    
        # Check each piece's possible moves to see if any move can get the king out of check
        player_pieces.flatten.each do |piece|
            case piece.name
            when /pawn/i
                pawn_moves = pawn_movement(piece.current_column, piece.current_row)
                return false unless checkmate_escapable?(piece, pawn_moves)
            when /rook/i
                rook_moves = rook_movement(piece.current_column, piece.current_row)
                return false unless checkmate_escapable?(piece, rook_moves)
            when /bishop/i
                bishop_moves = bishop_movement(piece.current_column, piece.current_row)
                return false unless checkmate_escapable?(piece, bishop_moves)
            when /knight/i
                knight_moves = knight_movement(piece.current_column, piece.current_row)
                return false unless checkmate_escapable?(piece, knight_moves)
            when /queen/i
                queen_moves = queen_movement(piece.current_column, piece.current_row)
                return false unless checkmate_escapable?(piece, queen_moves)
            when /king/i
                king_moves = king_movement(piece.current_column, piece.current_row)
                return false unless checkmate_escapable?(piece, king_moves)
            end
        end
    
        @checkmate = true
        true
    end

    def checkmate_escapable?(piece, moves)
        return false unless @in_check == true
        moves.each do |move|
            # Simulate the move and check if it gets the king out of check
            @board[move[1]][move[0]], @board[piece.current_row][piece.current_column] = piece, nil

            if @in_check == false
                # If the king is not in check after the move, it's not checkmate
                @board[piece.current_row][piece.current_column] = piece
                @board[move[1]][move[0]] = nil
                return false
            end

            # Restore the board for the next iteration
            @board[piece.current_row][piece.current_column] = piece
            @board[move[1]][move[0]] = nil
        end

        # If no move gets the king out of check, it's checkmate
        false
    end

    def find_pieces
        white_pieces = @player_one_pieces.flatten
        black_pieces = @player_two_pieces.flatten

        # Check if ONLY kings, or ONLY kings AND a knight, or kings AND a bishop of the same color are present.
        white_condition = white_pieces.all? { |piece| piece.name.include?('King') } && white_pieces.length <= 2
        black_condition = black_pieces.all? { |piece| piece.name.include?('King') } && black_pieces.length <= 2

        if white_condition && black_condition
            @insufficient_material = true
            true
        else
            # Check if ONLY kings, or ONLY kings AND a knight, or kings AND a bishop of the same color are present for white pieces.
            white_condition = white_pieces.all? do |piece|
                piece.name.include?('King') ||(piece.name.include?('Knight') && white_pieces.all? { |p| p.name.include?('King') || p.name.include?('Knight') }) ||
                (piece.name.include?('Bishop') && white_pieces.all? { |p| p.name.include?('King') || p.name.include?('Bishop') }) && white_pieces.length <= 3
            end

            # Check if ONLY kings, or ONLY kings AND a knight, or kings AND a bishop of the same color are present for black pieces.
            black_condition = black_pieces.all? do |piece|
                piece.name.include?('King') ||(piece.name.include?('Knight') && black_pieces.all? { |p| p.name.include?('King') || p.name.include?('Knight') }) ||
                (piece.name.include?('Bishop') && black_pieces.all? { |p| p.name.include?('King') || p.name.include?('Bishop') }) && black_pieces.length <= 3
            end

            if white_condition && black_condition
                @insufficient_material = true
                true
            end
        end
    end

    def legal_moves
        opponent_pieces = (@current_player == @player_one) ? @player_two_pieces : @player_one_pieces
        opponent_moves = []

        opponent_pieces.flatten.each do |piece|
            possible_moves =
            case piece.name
            when /Pawn/
                pawn_movement(piece.current_column, piece.current_row)
            when /Rook/
                rook_movement(piece.current_column, piece.current_row)
            when /Bishop/
                bishop_movement(piece.current_column, piece.current_row)
            when /Knight/
                knight_movement(piece.current_column, piece.current_row)
            when /Queen/
                queen_movement(piece.current_column, piece.current_row)
            when /King/
                king_movement(piece.current_column, piece.current_row)
            end

            if possible_moves
                opponent_moves.concat(possible_moves)
            else
                return false
            end
        end

        opponent_moves.any?
    end

    def stalemate
        return false if @checkmate || @in_check == true

        if legal_moves == false && @in_check == false || @insufficient_material == true
            true
        else
            false
        end
    end

    def assign_players
        loop do
            puts "Enter your name Player 1"
            @player_one_name = gets.chomp.capitalize
        
            # Check if the name contains only alphanumerical characters
            if @player_one_name.match?(/\A[a-zA-Z]+\z/)
                @player_one = Player.new(@player_one_name, @player_one_color)
                break
            else
                puts "Invalid name. Please use only alphanumerical characters."
            end
        end

        loop do
            puts "Enter your name Player 2"
            @player_two_name = gets.chomp.capitalize
        
            if @player_two_name.match?(/\A[a-zA-Z]+\z/)
                @player_two = Player.new(@player_two_name, @player_two_color)
                break
            else
                puts "Invalid name. Please use only alphanumerical characters."
            end
        end
        
        @current_player = @player_one
        puts "Okay #{@player_one.name}, you're up. Make a move."
    end

    def assign_coordinates
        loop do
            puts "Enter current column of piece you wish to move from"
            current_column = gets.chomp.to_i

            until current_column.is_a?(Integer) && current_column.between?(0, 7)
                puts "Illegal selection, enter an integer between 0 and 7 for current column"
                current_column = gets.chomp.to_i
            end

            puts "Enter current row of piece you wish to move from"
            current_row = gets.chomp.to_i

            until current_row.is_a?(Integer) && current_row.between?(0, 7)
                puts "Illegal selection, enter an integer between 0 and 7 for current row"
                current_row = gets.chomp.to_i
            end

            puts "Enter the destination column you wish to move to"
            destination_column = gets.chomp.to_i

            until destination_column.is_a?(Integer) && destination_column.between?(0, 7)
                puts "Illegal selection, enter an integer between 0 and 7 for destination column"
                destination_column = gets.chomp.to_i
            end

            puts "Enter the destination row you wish to move to"
            destination_row = gets.chomp.to_i

            until destination_row.is_a?(Integer) && destination_row.between?(0, 7)
                puts "Illegal selection, enter an integer between 0 and 7 for destination row"
                destination_row = gets.chomp.to_i
            end

            [current_column, current_row, destination_column, destination_row]
            move = move_piece(destination_column, destination_row, current_column, current_row)

            break if move
        end
        
    end

    def switch_players
        @current_player = @current_player == @player_one ? @player_two : @player_one

        current_player_name = case @current_player
        when @player_one then @player_one_name
        when @player_two then @player_two_name
        end

        puts "current player is now #{current_player_name}"
    end

    def illegal_move
        puts "Illegal move, Make another move"
        return
    end

    def update_board(new_column, new_row, old_column, old_row)
        piece = get_piece_at(old_column, old_row)
        return unless piece

        # Remove the piece from its old position
        @board[old_row][old_column] = nil

        # Place the piece in its new position
        @board[new_row][new_column] = piece

        # Update the piece's current_column and current_row
        piece.current_column = new_column
        piece.current_row = new_row
    end

    def check_winner
        if @checkmate == true
            if @current_player == @player_one 
                puts "#{@player_one_name} wins the game! Checkmate!"
                return true
            elsif @current_player == @player_two
                puts "#{@player_two_name} wins the game! Checkmate!"
                return true
            end
        end
        false
    end

    def make_move
        until check_winner == true
            assign_coordinates
            display_updated_board
            find_pieces
            king_in_check?
            checkmate?
            stalemate
            switch_players
            check_winner
        end
    end

    def play_game
        assign_players
        setup_board_2
        scan_board
        make_move
    end
end


game = ChessBoard.new
game.display_board
hoe = ChessGame.new
hoe.play_game