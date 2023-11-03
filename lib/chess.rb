class Player
    attr_reader :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end
end

class ChessPiece
    attr_reader :name, :unicode, :column, :row

    def initialize(name, unicode)
        @name = name
        @unicode = unicode
        @column = column
        @row = row
    end

    BLACK_PAWN = ChessPiece.new("Black Pawn", "\u265F")
    BLACK_KNIGHT = ChessPiece.new("Black Knight", "\u265E")
    BLACK_BISHOP = ChessPiece.new("Black Bishop", "\u265D")
    BLACK_ROOK = ChessPiece.new("Black Rook", "\u265C")
    BLACK_KING = ChessPiece.new("Black King", "\u265A")
    BLACK_QUEEN = ChessPiece.new("Black Queen", "\u265B")

    WHITE_PAWN = ChessPiece.new("White Pawn", "\u2659")
    WHITE_KNIGHT = ChessPiece.new("White Knight", "\u2658")
    WHITE_BISHOP = ChessPiece.new("White Bishop", "\u2657")
    WHITE_ROOK = ChessPiece.new("White Rook", "\u2656")
    WHITE_QUEEN = ChessPiece.new("White Queen", "\u2655")
    WHITE_KING = ChessPiece.new("White King", "\u2654")
end

class Chessboard < ChessPiece
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
        @black_pawn = ChessPiece::BLACK_PAWN
        @black_knight = ChessPiece::BLACK_KNIGHT
        @black_bishop = ChessPiece::BLACK_BISHOP
        @black_rook = ChessPiece::BLACK_ROOK
        @black_king = ChessPiece::BLACK_KING
        @black_queen = ChessPiece::BLACK_QUEEN

        @white_pawn = ChessPiece::WHITE_PAWN
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
        @current_player = ''
        @pieces_captured_by_player_one = 0
        @player_one_pieces_remaining = 16
        @pieces_captured_by_player_two = 0
        @player_two_pieces_remaining = 16
        @black_pieces = [ChessPiece::BLACK_PAWN, ChessPiece::BLACK_KNIGHT, ChessPiece::BLACK_BISHOP, ChessPiece::BLACK_ROOK, ChessPiece::BLACK_KING, ChessPiece::BLACK_QUEEN]
        @white_pieces = [ChessPiece::WHITE_PAWN, ChessPiece::WHITE_KNIGHT, ChessPiece::WHITE_BISHOP, ChessPiece::WHITE_ROOK, ChessPiece::WHITE_KING, ChessPiece::WHITE_QUEEN]
        @player_one = ''
        @player_two = ''
        @player_one_pieces = @white_pieces
        @player_two_pieces = @black_pieces
        @player_one_pieces = nil
        @player_two_pieces = nil
        @double_move_made = false
        @in_check? = false
        @king_moved? = false
        @rook_moved? = false
        @square_under_attack? = false
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

    def capture_piece(destination_column, destination_row, color)
        opponent_pieces = @current_player == 'player_one' ? @black_pieces : @white_pieces
        opponent_piece = opponent_pieces.find { |piece| piece.column == destination_column && piece.row == destination_row }
        
        if opponent_piece
            opponent_pieces.delete(opponent_piece)
            puts "#{@current_player}'s pawn captured #{@current_player}'s #{opponent_piece.name} at #{opponent_piece.column}, #{opponent_piece.row}"
    
            if color == :white
                @pieces_captured_by_player_one += 1
                @player_two_pieces_remaining -= 1
            else
                @pieces_captured_by_player_two += 1
                @player_one_pieces_remaining -= 1
            end
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
        opponent_piece = opponent_pieces.find { |piece| piece.column == destination_column && piece.row == destination_row }

        if opponent_piece
            opponent_pieces.delete(opponent_piece)
            puts "#{@current_player}'s pawn captured #{@current_player}'s #{opponent_piece.name} en passant at #{opponent_piece.column}, #{opponent_piece.row}"
      
            if color == :white
                @pieces_captured_by_player_one += 1
                @player_two_pieces_remaining -= 1
            else
                @pieces_captured_by_player_two += 1
                @player_one_pieces_remaining -= 1
            end
        end
    end
end


#game = Chessboard.new
#game.display_board
