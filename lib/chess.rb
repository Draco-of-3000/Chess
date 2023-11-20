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
    BLACK_KNIGHT = ChessPiece.new("Black Knight", "\u265E", 1, 7, 'black')
    BLACK_BISHOP = ChessPiece.new("Black Bishop", "\u265D", 1, 8, 'black')
    BLACK_ROOK = ChessPiece.new("Black Rook", "\u265C", 0, 7, 'black')
    BLACK_KING = ChessPiece.new("Black King", "\u265A", 3, 7, 'black')
    BLACK_QUEEN = ChessPiece.new("Black Queen", "\u265B", 4, 7, 'black')

    WHITE_PAWN_1 = ChessPiece.new("White Pawn 1", "\u2659", 0, 1, 'white')
    WHITE_PAWN_2 = ChessPiece.new("White Pawn 2", "\u2659", 1, 0, 'white')
    WHITE_PAWN_3 = ChessPiece.new("White Pawn 3", "\u2659", 2, 0, 'white')
    WHITE_PAWN_4 = ChessPiece.new("White Pawn 4", "\u2659", 3, 0, 'white')
    WHITE_PAWN_5 = ChessPiece.new("White Pawn 5", "\u2659", 4, 0, 'white')
    WHITE_PAWN_6 = ChessPiece.new("White Pawn 6", "\u2659", 5, 0, 'white')
    WHITE_PAWN_7 = ChessPiece.new("White Pawn 7", "\u2659", 6, 0, 'white')
    WHITE_PAWN_8 = ChessPiece.new("White Pawn 8", "\u2659", 7, 0, 'white')
    WHITE_KNIGHT = ChessPiece.new("White Knight", "\u2658", 1, 0, 'white')
    WHITE_BISHOP = ChessPiece.new("White Bishop", "\u2657", 2, 0, 'white')
    WHITE_ROOK = ChessPiece.new("White Rook", "\u2656", 0, 0, 'white')
    WHITE_QUEEN = ChessPiece.new("White Queen", "\u2655", 4, 0, 'white')
    WHITE_KING = ChessPiece.new("White King", "\u2654", 3, 0, 'white')
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
        @black_knight = ChessPiece::BLACK_KNIGHT
        @black_bishop = ChessPiece::BLACK_BISHOP
        @black_rook = ChessPiece::BLACK_ROOK
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
        @white_knight = ChessPiece::WHITE_KNIGHT
        @white_bishop = ChessPiece::WHITE_BISHOP
        @white_rook = ChessPiece::WHITE_ROOK
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

    def letters
        "      a       b       c       d       e       f       g       h"
    end

    def display_board
        puts letters
        puts seperator
        puts "8 |   #{@black_rook.unicode}   |   #{@black_knight.unicode}   |   #{@black_bishop.unicode}   |   #{@black_queen.unicode}   |   #{@black_king.unicode}   |   #{@black_bishop.unicode}   |   #{@black_knight.unicode}   |   #{@black_rook.unicode}   |"
        puts seperator
        puts "7 |   #{@black_pawn.unicode}   |   #{@black_pawn.unicode}   |   #{@black_pawn.unicode}   |   #{@black_pawn.unicode}   |   #{@black_pawn.unicode}   |   #{@black_pawn.unicode}   |   #{@black_pawn.unicode}   |   #{@black_pawn.unicode}   |"
        puts seperator
        puts "6 |   #{label_at(16)}  |   #{label_at(17)}  |   #{label_at(18)}  |   #{label_at(19)}  |   #{label_at(20)}  |   #{label_at(21)}  |   #{label_at(22)}  |   #{label_at(23)}  |"
        puts seperator
        puts "5 |   #{label_at(24)}  |   #{label_at(25)}  |   #{label_at(26)}  |   #{label_at(27)}  |   #{label_at(28)}  |   #{label_at(29)}  |   #{label_at(30)}  |   #{label_at(31)}  |"
        puts seperator
        puts "4 |   #{label_at(32)}  |   #{label_at(33)}  |   #{label_at(34)}  |   #{label_at(35)}  |   #{label_at(36)}  |   #{label_at(37)}  |   #{label_at(38)}  |   #{label_at(39)}  |"
        puts seperator
        puts "3 |   #{label_at(40)}  |   #{label_at(41)}  |   #{label_at(42)}  |   #{label_at(43)}  |   #{label_at(44)}  |   #{label_at(45)}  |   #{label_at(46)}  |   #{label_at(47)}  |"
        puts seperator
        puts "2 |   #{@white_rook.unicode}   |   #{@white_knight.unicode}   |   #{@white_bishop.unicode}   |   #{@white_queen.unicode}   |   #{@white_king.unicode}   |   #{@white_bishop.unicode}   |   #{@white_knight.unicode}   |   #{@white_rook.unicode}   |"
        puts seperator
        puts "1 |   #{@white_pawn.unicode}   |   #{@white_pawn.unicode}   |   #{@white_pawn.unicode}   |   #{@white_pawn.unicode}   |   #{@white_pawn.unicode}   |   #{@white_pawn.unicode}   |   #{@white_pawn.unicode}   |   #{@white_pawn.unicode}   |"
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
        @black_pieces = [@black_pawns, ChessPiece::BLACK_KNIGHT, ChessPiece::BLACK_BISHOP, ChessPiece::BLACK_ROOK, ChessPiece::BLACK_KING, ChessPiece::BLACK_QUEEN]
        @white_pieces = [@white_pawns, ChessPiece::WHITE_KNIGHT, ChessPiece::WHITE_BISHOP, ChessPiece::WHITE_ROOK, ChessPiece::WHITE_KING, ChessPiece::WHITE_QUEEN]
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

    def pawn_movement(column, row, color)
        pawn_moves = []
    
        direction = (color == :white) ? 1 : -1
    
        # Regular forward move
        regular_move = [column, row + direction]
        pawn_moves << regular_move if pawn_valid_move?(regular_move)
    
        # Double move on the first turn
        double_move = [column, row + 2 * direction]
        if row == (color == :white ? 1 : 6) && pawn_valid_move?(double_move)
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

    def en_passant_possible?(column, row, color)
        direction = (color == :white) ? 1 : -1
        fifth_rank = (color == :white) ? 4 : 3

        if row == fifth_rank
            double_move = [column, row + 2 * direction]
            return true if @double_move_made && pawn_valid_move?(double_move)
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
        piece = @black_pieces.concat(@white_pieces).find do |piece|
          piece.instance_variable_get(:@start_column) == column && piece.instance_variable_get(:@start_row) == row
        end
      
        return piece if piece
      
        nil
    end

    def move_piece(new_column, new_row, old_column, old_row)
        piece = get_piece_at(old_column, old_row)
        return unless piece
      
        valid_moves = case piece.name
        when /pawn/i
          pawn_movement(old_column, old_row, piece.color)
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

        if valid_moves.include?([new_column, new_row])
            capture_piece(old_column, old_row, new_column, new_row) unless ENV['SKIP_CAPTURE_PIECE'] 
            piece.current_column = new_column
            piece.current_row = new_row
        else
            illegal_move
        end
    end

    def castling_possible?(color)
        return false if @king_moved == true || @rook_moved == true

        # Determine the column of the king and rook based on the color
        king_column = (color == :white) ? 4 : 3
        rook_column = (color == :white) ? 7 : 0

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
        return false unless @in_check == true

        player_pieces = (@current_player == @player_one) ? @white_pieces : @black_pieces
    
        # Check each piece's possible moves to see if any move can get the king out of check
        player_pieces.flatten.each do |piece|
            case piece.name
            when /Pawn/
                pawn_moves = pawn_movement(piece.current_column, piece.current_row, @current_player)
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
        opponent_pieces = (color == :white) ? @black_pieces : @white_pieces
        opponent_moves = []

        opponent_pieces.flatten.each do |piece|
            possible_moves =
            case piece.name
            when /Pawn/
                pawn_movement(piece.current_column, piece.current_row, piece.color)
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

    def make_move
        until @checkmate == true || stalemate == true
            find_pieces
            king_in_check?
            checkmate?
            stalemate
            assign_coordinates
            move_piece(destination_column, destination_row, current_column, current_row)
            update_board
            switch_players
        end
    end
end


#game = ChessBoard.new
#game.display_board
