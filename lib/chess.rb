class Player
    attr_reader :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end
end

class ChessPiece
    attr_accessor :name, :unicode, :start_column, :start_row, :current_column, :current_row, :color

    def initialize(name, unicode, start_column, start_row, color)
        @name = name
        @unicode = unicode
        @start_column = start_column
        @start_row = start_row
        @current_column = nil
        @current_row = nil
        @color = color
    end

    BLACK_PAWN_1 = ChessPiece.new("Black Pawn 1", "\u265F", 0, 6, 'black')
    BLACK_PAWN_2 = ChessPiece.new("Black Pawn 2", "\u265F", 1, 6, 'black')
    BLACK_PAWN_3 = ChessPiece.new("Black Pawn 3", "\u265F", 2, 6, 'black')
    BLACK_PAWN_4 = ChessPiece.new("Black Pawn 4", "\u265F", 3, 6, 'black')
    BLACK_PAWN_5 = ChessPiece.new("Black Pawn 5", "\u265F", 4, 6, 'black')
    BLACK_PAWN_6 = ChessPiece.new("Black Pawn 6", "\u265F", 5, 6, 'black')
    BLACK_PAWN_7 = ChessPiece.new("Black Pawn 7", "\u265F", 6, 6, 'black')
    BLACK_PAWN_8 = ChessPiece.new("Black Pawn 8", "\u265F", 7, 6, 'black')
    BLACK_KNIGHT_1 = ChessPiece.new("Black Knight 1", "\u265E", 1, 7, 'black')
    BLACK_KNIGHT_2 = ChessPiece.new("Black Knight 2", "\u265E", 6, 7, 'black')
    BLACK_BISHOP_1 = ChessPiece.new("Black Bishop 1", "\u265D", 2, 7, 'black')
    BLACK_BISHOP_2 = ChessPiece.new("Black Bishop 2", "\u265D", 5, 7, 'black')
    BLACK_ROOK_1 = ChessPiece.new("Black Rook 1", "\u265C", 0, 7, 'black')
    BLACK_ROOK_2 = ChessPiece.new("Black Rook 2", "\u265C", 7, 7, 'black')
    BLACK_KING = ChessPiece.new("Black King", "\u265A", 4, 7, 'black')
    BLACK_QUEEN = ChessPiece.new("Black Queen", "\u265B", 3, 7, 'black')

    WHITE_PAWN_1 = ChessPiece.new("White Pawn 1", "\u2659", 0, 1, 'white')
    WHITE_PAWN_2 = ChessPiece.new("White Pawn 2", "\u2659", 1, 1, 'white')
    WHITE_PAWN_3 = ChessPiece.new("White Pawn 3", "\u2659", 2, 1, 'white')
    WHITE_PAWN_4 = ChessPiece.new("White Pawn 4", "\u2659", 3, 1, 'white')
    WHITE_PAWN_5 = ChessPiece.new("White Pawn 5", "\u2659", 4, 1, 'white')
    WHITE_PAWN_6 = ChessPiece.new("White Pawn 6", "\u2659", 5, 1, 'white')
    WHITE_PAWN_7 = ChessPiece.new("White Pawn 7", "\u2659", 6, 1, 'white')
    WHITE_PAWN_8 = ChessPiece.new("White Pawn 8", "\u2659", 7, 1, 'white')
    WHITE_KNIGHT_1 = ChessPiece.new("White Knight 1", "\u2658", 1, 0, 'white')
    WHITE_KNIGHT_2 = ChessPiece.new("White Knight 2", "\u2658", 6, 0, 'white')
    WHITE_BISHOP_1 = ChessPiece.new("White Bishop 1", "\u2657", 2, 0, 'white')
    WHITE_BISHOP_2 = ChessPiece.new("White Bishop 2", "\u2657", 5, 0, 'white')
    WHITE_ROOK_1 = ChessPiece.new("White Rook 1", "\u2656", 0, 0, 'white')
    WHITE_ROOK_2 = ChessPiece.new("White Rook 2", "\u2656", 7, 0, 'white')
    WHITE_QUEEN = ChessPiece.new("White Queen", "\u2655", 3, 0, 'white')
    WHITE_KING = ChessPiece.new("White King", "\u2654", 4, 0, 'white')
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
    attr_accessor :chessboard, :board, :player_one_pieces, :player_pieces
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
        @player_one_color = 'white'
        @player_two_color = 'black'
        @player_one_pieces = @white_pieces
        @player_two_pieces = @black_pieces
        @player_one_pieces = nil
        @player_two_pieces = nil
        @double_move_made = false
        @in_check = false
        @checkmate = false
        @king_moved = false
        @rook_moved = false
        @square_under_attack = false
        @insufficient_material = false
    end

    def setup_board
        @board

        setup_pieces(@major_black_pieces)
        setup_pieces(@major_white_pieces)
        setup_pieces(@white_pawns)
        setup_pieces(@black_pawns)

        @board
    end

    def setup_pieces(pieces)
        pieces.each do |piece|
            if piece.start_column && piece.start_row
                column = piece.start_column
                row = piece.start_row
                @board[row][column] = piece
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
            if piece.nil?
              print "  #{row}, #{col} |"
            else
              print "   #{piece.unicode}   |"
            end
          end
          
          puts "\n--+-------+-------+-------+-------+-------+-------+-------+-------+"
        end
    end
    
    def pawn_movement(column, row)
        pawn_moves = []
    
        direction = (@current_player == @player_one) ? 1 : -1
    
        # Regular forward move
        regular_move = [column, row + direction]
        pawn_moves << regular_move if pawn_valid_move?(regular_move)
    
        # Double move on the first turn
        double_move = [column, row + 2 * direction]
        if row == (@current_player == @player_one ? 1 : 6) && pawn_valid_move?(double_move)
            pawn_moves << double_move
            @double_move_made = true
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
        opponent_pieces = @current_player == @player_one ? @black_pieces : @white_pieces
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
        pawn_piece = retrieve_pawn(current_column, current_row)

        if pawn_piece

            direction = (pawn_piece.color == 'white') ? 1 : -1
            fifth_rank = (pawn_piece.color == 'white') ? 4 : 3

            if current_row == fifth_rank
                double_move = [current_column, current_row + 2 * direction]
                return true if @double_move_made && pawn_valid_move?(double_move)
            end
        end

        false
    end

    def en_passant_capture(destination_column, destination_row, color)
        opponent_pieces = @current_player == 'player_one' ? @black_pieces : @white_pieces
        opponent_piece = opponent_pieces.find { |piece| piece.current_column == destination_column && piece.current_row == destination_row }

        if opponent_piece
            opponent_pieces.delete(opponent_piece)
            puts "#{@current_player}'s pawn captured #{@current_player}'s #{opponent_piece.name} en passant at #{opponent_piece.current_column}, #{opponent_piece.current_row}"
      
            if color == :white
                @pieces_captured_by_player_one += 1
                @player_two_pieces_remaining -= 1
            else
                @pieces_captured_by_player_two += 1
                @player_one_pieces_remaining -= 1
            end
        end
    end

    def get_piece_at(column, row)
        piece = @board[row][column]

        return piece if piece
      
        nil
    end

    def move_piece(new_column, new_row, old_column, old_row)
        piece = get_piece_at(old_column, old_row)
        return unless piece
      
        valid_moves = case piece.name
        when /pawn/i
            pawn_movement(old_column, old_row, piece.color)
            en_passant_possible?
        when /king/i
            king_movement(old_column, old_row)
            @king_moved = true
            castling_possible?
        when /knight/i
            knight_movement(old_column, old_row)
        when /bishop/i
            bishop_movement(old_column, old_row)
        when /rook/i
            rook_movement(old_column, old_row)
            @rook_moved = true
            castling_possible?
        when /queen/i
            queen_movement(old_column, old_row)
        end

        if valid_moves.include?([new_column, new_row])
            capture_piece(old_column, old_row, new_column, new_row) unless ENV['SKIP_CAPTURE_PIECE'] 
            piece.current_column = new_column
            piece.current_row = new_row
        else
            illegal_move
        end
    end

    def castling_possible?
        return false if @king_moved == true || @rook_moved == true

        # Determine the column of the king and rook based on the color
        king_column = (@current_player == @player_one) ? 4 : 3
        rook_column = (@current_player == @player_one) ? 7 : 0

        # Check if the king and rook are present at their starting positions
        return false unless get_piece_at(king_column, 0)&.name == "#{color.to_s.capitalize} King"
        return false unless get_piece_at(rook_column, 0)&.name == "#{color.to_s.capitalize} Rook"

        # Check that the squares between the king and rook are unoccupied
        (1..2).each do |column|
            return false unless get_piece_at(column, 0).nil?
        end

        true
    end

    def castling(color)
        # Assuming castling is valid and already checked
        king_column = (color == :white) ? 4 : 3
        rook_column = (color == :white) ? 7 : 0
      
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

    def pawn_promotion(column, row, current_player)
        current_player = @current_player

        pawn = get_piece_at(column, row)

        return unless (@black_pawns.include?(pawn) || @white_pawns.include?(pawn)) && (row == 0 || row == 7)

        piece_color = (current_player == @player_one) ? :white : :black

        puts "#{current_player.capitalize}, choose the piece for pawn promotion (queen, king, rook, bishop, knight):"
        piece_choice = gets.chomp.downcase

        unless ['queen', 'king', 'rook', 'bishop', 'knight'].include?(piece_choice)
            puts "Invalid piece choice for promotion."
            return
        end

        new_piece = case piece_choice
        
        when 'queen'
          ChessPiece.new("#{piece_color.to_s.capitalize} Queen", (piece_color == :white ? "\u2655" : "\u265B"))
        when 'rook'
          ChessPiece.new("#{piece_color.to_s.capitalize} Rook", (piece_color == :white ? "\u2656" : "\u265C"))
        when 'bishop'
          ChessPiece.new("#{piece_color.to_s.capitalize} Bishop", (piece_color == :white ? "\u2657" : "\u265D"))
        when 'knight'
          ChessPiece.new("#{piece_color.to_s.capitalize} Knight", (piece_color == :white ? "\u2658" : "\u265E"))
        end

        replace_piece(pawn, new_piece)
        puts "#{piece_color.to_s.capitalize} promotes a pawn to a #{piece_choice.capitalize} at #{column}, #{row}."
    end

    def king_in_check?
        king_piece = color == :white ? ChessPiece::WHITE_KING : ChessPiece::BLACK_KING

        opponent_pieces = color == :white ? @black_pieces : @white_pieces

        opponent_pieces.flatten.each do |piece|
            possible_moves =
            
            case piece.name
            when /Pawn/
                pawn_movement(piece.current_column, piece.current_row, color)
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

            if possible_moves.include?([king_piece.current_column, king_piece.current_row])
                @in_check = true
                return true
            end
        end

        false
    end

    def checkmate?
        return false unless @in_check == true || checkmate_possible? == true

        player_pieces = (@current_player == @player_one) ? @white_pieces : @black_pieces
    
        # Check each piece's possible moves to see if any move can get the king out of check
        player_pieces.flatten.each do |piece|
            case piece.name
            when /Pawn/
                pawn_moves = pawn_movement(piece.current_column, piece.current_row)
                return false unless checkmate_possible?(piece, pawn_moves)
            when /Rook/
                rook_moves = rook_movement(piece.current_column, piece.current_row)
                return false unless checkmate_possible?(piece, rook_moves)
            when /Bishop/
                bishop_moves = bishop_movement(piece.current_column, piece.current_row)
                return false unless checkmate_possible?(piece, bishop_moves)
            when /Knight/
                knight_moves = knight_movement(piece.current_column, piece.current_row)
                return false unless checkmate_possible?(piece, knight_moves)
            when /Queen/
                queen_moves = queen_movement(piece.current_column, piece.current_row)
                return false unless checkmate_possible?(piece, queen_moves)
            when /King/
                king_moves = king_movement(piece.current_column, piece.current_row)
                return false unless checkmate_possible?(piece, king_moves)
            end
        end
    
        @checkmate = true
        true
    end

    def checkmate_possible?(piece, moves)
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
        true
    end

    def find_pieces
        white_pieces = @white_pieces.flatten
        black_pieces = @black_pieces.flatten

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
        opponent_pieces = (@current_player == @player_one) ? @black_pieces : @white_pieces
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
        puts "Enter your name Player 1"
        @player_one_name = gets.chomp.capitalize
        @player_one = Player.new(@player_one_name, @player_one_color)

        puts "Enter your name Player 2"
        @player_two_name = gets.chomp.capitalize
        @player_two = Player.new(@player_two_name, @player_two_color)
        puts "Okay #{@player_one.name}, you're up. Make a move."
    end

    def assign_coordinates
        puts "Enter current column of piece you wish to move"
        current_column = gets.chomp.to_i

        until current_column.is_a?(Integer) && current_column.between?(0, 7)
            puts "Illegal selection, enter an integer between 0 and 7"
            current_column = gets.chomp.to_i
        end

        puts "Enter current row of piece you wish to move"
        current_row = gets.chomp.to_i

        until current_row.is_a?(Integer) && current_row.between?(0, 7)
            puts "Illegal selection, enter an integer between 0 and 7"
            current_row = gets.chomp.to_i
        end

        puts "Enter the column wish to move the piece to"
        destination_column = gets.chomp.to_i

        until destination_column.is_a?(Integer) && destination_column.between?(0, 7)
            puts "Illegal selection, enter an integer between 0 and 7"
            destination_column = gets.chomp.to_i
        end

        puts "Enter the row wish to move the piece to"
        destination_row = gets.chomp.to_i

        until destination_row.is_a?(Integer) && destination_row.between?(0, 7)
            puts "Illegal selection, enter an integer between 0 and 7"
            destination_row = gets.chomp.to_i
        end

        [current_column, current_row, destination_column, destination_row]
    end

    def switch_players(current_player)
        @current_player = @current_player == @player_one ? @player_two : @player_one
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
        until @checkmate == true || stalemate == true || check_winner == true
            assign_coordinates
            move_piece(destination_column, destination_row, current_column, current_row)
            update_board
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
        setup_board
        make_move
    end
end


game = ChessBoard.new
game.display_board
hoe = ChessGame.new
hoe.play_game
