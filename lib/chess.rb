require 'json'

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

    def to_json(*a)
        {
          name: @name,
          unicode: @unicode,
          start_column: @start_column,
          start_row: @start_row,
          current_column: @current_column,
          current_row: @current_row,
          color: @color
        }.to_json(*a)
    end
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

    def to_json(options = {})
        JSON.dump ({
          :board => @board
        }).to_json
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
        puts "3 |  #{"0, 3"} |  #{"1, 3"} |  #{"2, 3"} |  #{"3, 3"} |  #{"4, 3"} |  #{"5, 3"} |  #{"6, 3"} |  #{"7, 3"} |"
        puts seperator
        puts "2 |  #{"0, 2"} |  #{"1, 2"} |  #{"2, 2"} |  #{"3, 2"} |  #{"4, 2"} |  #{"5, 2"} |  #{"6, 2"} |  #{"7, 2"} |"
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
        @player_one_king_moved = false
        @player_one_rook_moved = false
        @player_two_king_moved = false
        @player_two_rook_moved = false
        @square_under_attack = false
        @insufficient_material = false
        @castling_attempted = true
        @castling_possible = false

        def to_json(options = {})
            JSON.dump({
                :chessboard => @chessboard.to_json,
                :board => @board,
                :pieces_captured_by_player_one => @pieces_captured_by_player_one,
                :player_one_pieces_remaining => @player_one_pieces_remaining,
                :pieces_captured_by_player_two => @pieces_captured_by_player_two,
                :player_two_pieces_remaining => @player_two_pieces_remaining,
                :player_one => @player_one,
                :player_two => @player_two,
                :player_one_name => @player_one_name,
                :player_two_name => @player_two_name,
                :player_one_king => @player_one_king,
                :player_two_king => @player_two_king,
                :player_one_rook_1 => @player_one_rook_1,
                :player_one_rook_2 => @player_one_rook_2,
                :player_two_rook_1 => @player_two_rook_1,
                :player_two_rook_2 => @player_two_rook_2,
                :player_one_color => @player_one_color,
                :player_two_color => @player_two_color,
                :player_one_pieces => @player_one_pieces,
                :player_two_pieces => @player_two_pieces,
                :left_king_castling_column => @left_king_castling_column,
                :right_king_castling_column => @right_king_castling_column,
                :left_king_castling_move => @left_king_castling_move,
                :right_king_castling_move => @right_king_castling_move,
                :rook_1_castling_column => @rook_1_castling_column,
                :rook_1_castling_move => @rook_1_castling_move,
                :rook_2_castling_column => @rook_2_castling_column,
                :rook_2_castling_move => @rook_2_castling_move,
                :player_one_double_move_made => @player_one_double_move_made,
                :player_two_double_move_made => @player_two_double_move_made,
                :player_one_double_move_pawn => @player_one_double_move_pawn,
                :player_two_double_move_pawn => @player_two_double_move_pawn,
                :en_passant_possible => @en_passant_possible,
                :en_passant_move => @en_passant_move,
                :en_passant_piece => @en_passant_piece,
                :captured_en_passant => @captured_en_passant,
                :in_check => @in_check,
                :checkmate => @checkmate,
                :player_one_king_moved => @player_one_king_moved,
                :player_one_rook_moved => @player_one_rook_moved,
                :player_two_king_moved => @player_two_king_moved,
                :player_two_rook_moved => @player_two_rook_moved,
                :square_under_attack => @square_under_attack,
                :insufficient_material => @insufficient_material,
                :castling_attempted => @castling_attempted,
                :castling_possible => @castling_possible
                
            }).to_json
        end

        puts "Welcome To Chess!"

        if File.exist?('chess_save.json')
            load_game_option = prompt_load_game_option

            if load_game_option == 'yes'
                load_game
            else
                play_game
            end
        else
            play_game
        end
    end

    def prompt_load_game_option
        puts "Do you want to load a saved game? Type 'yes' or 'no'"
        input = gets.chomp.downcase 

        until input == 'yes' || input == 'no'
            puts "Invalid input. Do you want to load a saved game? Type 'yes' or 'no'"
            input = gets.chomp.downcase
        end

        input
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
        dummy_black_pieces = [ChessPiece::BLACK_ROOK_1, ChessPiece::BLACK_ROOK_2, ChessPiece::BLACK_KING, ChessPiece::BLACK_QUEEN]
        setup_pieces(dummy_black_pieces)
        setup_pieces(dummy_white_pieces)

        @board
    end

    def setup_pieces(pieces)
        pieces.each do |piece|
            if piece.start_column && piece.start_row && piece.current_column && piece.current_row
                column = piece.current_column
                row = piece.current_row
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

    #def scan_board_2
        @player_one_pieces = []
        @player_two_pieces = []

        @board.each do |row|
            row.each do |piece|
            next if piece.nil?
      
            if piece.is_a?(Hash) && piece[:color] == 'white' && piece[:start_column] && piece[:start_row] && piece[:current_column] && piece[:current_row]
                @player_one_pieces << piece
            elsif piece.is_a?(Hash) && piece[:color] == 'black' && piece[:start_column] && piece[:start_row] && piece[:current_column] && piece[:current_row]
                @player_two_pieces << piece
            end
          end
        end
    #end

      
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
        board_size = 8
        bishop_moves = []

        # Diagonal to the top-left
        left_up = [column - 1, row + 1]
        while left_up[0] >= 0 && left_up[1] < board_size
            bishop_moves << left_up.dup
            left_up[0] -= 1
            left_up[1] += 1
        end

        # Diagonal to the top-right
        right_up = [column + 1, row + 1]
        while right_up[0] < board_size && right_up[1] < board_size
            bishop_moves << right_up.dup
            right_up[0] += 1
            right_up[1] += 1
        end

        # Diagonal to the bottom-left
        left_down = [column - 1, row - 1]
        while left_down[0] >= 0 && left_down[1] >= 0
            bishop_moves << left_down.dup
            left_down[0] -= 1
            left_down[1] -= 1
        end

        # Diagonal to the bottom-right
        right_down = [column + 1, row - 1]
        while right_down[0] < board_size && right_down[1] >= 0
            bishop_moves << right_down.dup
            right_down[0] += 1
            right_down[1] -= 1
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
        piece = get_piece_at(current_column, current_row)

        if @current_player == @player_one
            opponent_piece = get_piece_at(destination_column, destination_row)

            if opponent_piece && opponent_piece.color == @player_two_color
                opponent_piece.current_column = nil
                opponent_piece.current_row = nil

                @player_two_pieces.delete(opponent_piece)
                puts "#{@player_one_name}'s #{piece.name} captured #{@player_two_name}'s #{opponent_piece.name} at #{destination_column}, #{destination_row}"
            end

        elsif @current_player == @player_two
            opponent_piece = get_piece_at(destination_column, destination_row)

            if opponent_piece && opponent_piece.color == @player_one_color
                opponent_piece.current_column = nil
                opponent_piece.current_row = nil

                puts "#{@player_two_name}'s #{piece.name} captured #{@player_one_name}'s #{opponent_piece.name} at #{destination_column}, #{destination_row}"
                @player_one_pieces.delete(opponent_piece)
            end
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
            right_opponent_pawn = find_piece_on_board(@player_two_double_move_pawn)
            left_opponent_pawn = find_piece_on_board(@player_two_double_move_pawn)
            column_plus_one = pawn_piece.current_column + 1
            column_minus_one = pawn_piece.current_column - 1

            if pawn_piece
                fifth_rank = 4

                if pawn_piece.current_row == fifth_rank && (
                    (right_opponent_pawn && right_opponent_pawn.current_column == column_plus_one && right_opponent_pawn.current_row == fifth_rank) ||
                    (left_opponent_pawn && left_opponent_pawn.current_column == column_minus_one && left_opponent_pawn.current_row == fifth_rank)
                    )
                    @en_passant_possible = true
                    puts "en passant is possible"
                    return true
                end
            end

        elsif @current_player == @player_two && @player_one_double_move_made == true
            pawn_piece = retrieve_pawn(current_column, current_row)
            right_opponent_pawn = find_piece_on_board(@player_two_double_move_pawn)
            left_opponent_pawn = find_piece_on_board(@player_two_double_move_pawn)
            column_plus_one = pawn_piece.current_column + 1
            column_minus_one = pawn_piece.current_column - 1

            if pawn_piece
                fifth_rank = 3

                if pawn_piece.current_row == fifth_rank && (
                    (right_opponent_pawn && right_opponent_pawn.current_column == column_plus_one && right_opponent_pawn.current_row == fifth_rank) ||
                    (left_opponent_pawn && left_opponent_pawn.current_column == column_minus_one && left_opponent_pawn.current_row == fifth_rank)
                    )
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

    def same_color_piece?(destination_column, destination_row)
        piece = get_piece_at(destination_column, destination_row)

        if @current_player == @player_one
            if piece.nil?
                return false
            elsif piece && piece.color == @player_one_color
                return true
            end

        elsif @current_player == @player_two
            if piece.nil?
                return false
            elsif piece && piece.color == @player_two_color
                return true
            end
        end

        false
    end

    def pawn_diagonal_capture(current_column, current_row)
        pawn = retrieve_pawn(current_column, current_row)
        valid_moves = []

        if @current_player == @player_one
            if pawn
                puts "pawn = #{pawn.name}"
                left_diagonal_column = pawn.current_column - 1
                left_diagonal_row = pawn.current_row + 1
    
                left_opponent_pawn = retrieve_pawn(left_diagonal_column, left_diagonal_row)
    
                if left_opponent_pawn
                    puts "left diagonal pawn = #{left_opponent_pawn.name}"
                    valid_moves << [left_opponent_pawn.current_column, left_opponent_pawn.current_row]
                end
    
                right_diagonal_column = pawn.current_column + 1
                right_diagonal_row = pawn.current_row + 1
    
                right_opponent_pawn = retrieve_pawn(right_diagonal_column, right_diagonal_row)
    
                if right_opponent_pawn
                    puts "right diagonal pawn = #{right_opponent_pawn.name}"
                    valid_moves << [right_opponent_pawn.current_column, right_opponent_pawn.current_row]
                    puts "valid diagonal moves #{valid_moves}"
                end
            end
        
        elsif @current_player == @player_two
            if pawn
                puts "pawn = #{pawn.name}"
                left_diagonal_column = pawn.current_column - 1
                left_diagonal_row = pawn.current_row - 1
    
                left_opponent_pawn = retrieve_pawn(left_diagonal_column, left_diagonal_row)
    
                if left_opponent_pawn
                    puts "left diagonal pawn = #{left_opponent_pawn.name}"
                    valid_moves << [left_opponent_pawn.current_column, left_opponent_pawn.current_row]
                end
    
                right_diagonal_column = pawn.current_column + 1
                right_diagonal_row = pawn.current_row - 1
    
                right_opponent_pawn = retrieve_pawn(right_diagonal_column, right_diagonal_row)
    
                if right_opponent_pawn
                    puts "right diagonal pawn = #{right_opponent_pawn.name}"
                    valid_moves << [right_opponent_pawn.current_column, right_opponent_pawn.current_row]
                    puts "valid diagonal moves #{valid_moves}"
                end
            end
        end

        return valid_moves
    end

    def get_move_path(current_column, current_row)
        if @current_player == @player_one
            piece = get_piece_at(current_column, current_row)

            board_size = 8

            left_square = get_piece_at(piece.current_column - 1, piece.current_row)
            left_diagonal_square = get_piece_at(piece.current_column - 1, piece.current_row + 1)
            square_above = get_piece_at(piece.current_column, piece.current_row + 1)
            right_square = get_piece_at(piece.current_column + 1, piece.current_row)
            right_diagonal_square = get_piece_at(piece.current_column + 1, piece.current_row + 1)
            left_diagonal_bottom_square = get_piece_at(piece.current_column - 1, piece.current_row - 1)
            right_diagonal_bottom_square = get_piece_at(piece.current_column + 1, piece.current_row - 1)


            invalid_moves = []

            if left_square
                invalid_moves << [left_square.current_column, left_square.current_row]

                (piece.current_column - 1).downto(0) do |column|
                    square = get_piece_at(column, piece.current_row)

                    if square.nil?
                        invalid_moves << [column, piece.current_row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if left_diagonal_square && !piece&.name&.match?(/Bishop/i)
                invalid_moves << [left_diagonal_square.current_column, left_diagonal_square.current_row]

                (piece.current_row + 1).upto(board_size - 1) do |row|
                    column = piece.current_column - (piece.current_row - row)
                    break if column < 0
              
                    square = get_piece_at(column, row)

                    if square.nil?
                        invalid_moves << [column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if square_above && !piece&.name&.match?(/Bishop/i)
                invalid_moves << [square_above.current_column, square_above.current_row]

                (piece.current_row + 1).upto(board_size - 1) do |row|
                    square = get_piece_at(piece.current_column, row)

                    if square.nil?
                        invalid_moves << [piece.current_column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if right_square
                invalid_moves << [right_square.current_column, right_square.current_row]

                (piece.current_column + 1).upto(board_size - 1) do |column|
                    square = get_piece_at(column, piece.current_row)

                    if square.nil?
                        invalid_moves << [column, piece.current_row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if right_diagonal_square && !piece&.name&.match?(/Bishop/i)
                invalid_moves << [right_diagonal_square.current_column, right_diagonal_square.current_row]

                (piece.current_row + 1).upto(board_size - 1) do |row|
                    column = piece.current_column + (piece.current_row - row)
                    break if column >= board_size
          
                    square = get_piece_at(column, row)

                    if square.nil?
                        invalid_moves << [column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if left_diagonal_bottom_square && !piece&.name&.match?(/Bishop/i)
                invalid_moves << [left_diagonal_bottom_square.current_column, left_diagonal_bottom_square.current_row]
        
                (piece.current_row - 1).downto(0) do |row|
                    column = piece.current_column - (piece.current_row - row)
                    break if column < 0
        
                    square = get_piece_at(column, row)

                    if square.nil?
                        invalid_moves << [column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end
        
            if right_diagonal_bottom_square && !piece&.name&.match?(/Bishop/i)
                invalid_moves << [right_diagonal_bottom_square.current_column, right_diagonal_bottom_square.current_row]
        
                (piece.current_row - 1).downto(0) do |row|
                    column = piece.current_column + (piece.current_row - row)
                
                    square = get_piece_at(column, row)

                    if square.nil?
                        invalid_moves << [column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

        elsif @current_player == @player_two
            piece = get_piece_at(current_column, current_row)

            puts "piece = #{piece.name}"
            board_size = 8

            left_square = get_piece_at(piece.current_column - 1, piece.current_row)
            left_diagonal_square = get_piece_at(piece.current_column - 1, piece.current_row - 1)  # Adjusted direction
            square_below = get_piece_at(piece.current_column, piece.current_row - 1)  # Adjusted direction
            right_square = get_piece_at(piece.current_column + 1, piece.current_row)
            right_diagonal_square = get_piece_at(piece.current_column + 1, piece.current_row - 1)  # Adjusted direction
            left_diagonal_bottom_square = get_piece_at(piece.current_column - 1, piece.current_row - 1)  # Adjusted direction
            right_diagonal_bottom_square = get_piece_at(piece.current_column + 1, piece.current_row - 1)  # Adjusted direction


            invalid_moves = []

            if left_square
                invalid_moves << [left_square.current_column, left_square.current_row]

                (piece.current_column - 1).downto(0) do |column|
                    square = get_piece_at(column, piece.current_row)

                    if square.nil?
                        invalid_moves << [column, piece.current_row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if left_diagonal_square
                invalid_moves << [left_diagonal_square.current_column, left_diagonal_square.current_row]

                (piece.current_row - 1).downto(0) do |row|
                    column = piece.current_column - (piece.current_row - row)
                    break if column < 0
              
                    square = get_piece_at(column, row)

                    if square.nil?
                        invalid_moves << [column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if square_below
                invalid_moves << [square_below.current_column, square_below.current_row]
            
                (piece.current_row - 1).downto(0) do |row|  # Adjusted direction
                    square = get_piece_at(piece.current_column, row)

                    if square.nil?
                        invalid_moves << [piece.current_column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if right_square
                invalid_moves << [right_square.current_column, right_square.current_row]

                (piece.current_column + 1).upto(board_size - 1) do |column|
                    square = get_piece_at(column, piece.current_row)

                    if square.nil?
                        invalid_moves << [column, piece.current_row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if right_diagonal_square
                invalid_moves << [right_diagonal_square.current_column, right_diagonal_square.current_row]

                (piece.current_row - 1).downto(0) do |row|
                    column = piece.current_column + (piece.current_row - row)
                    break if column >= board_size
          
                    square = get_piece_at(column, row)

                    if square.nil?
                        invalid_moves << [column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end

            if left_diagonal_bottom_square
                invalid_moves << [left_diagonal_bottom_square.current_column, left_diagonal_bottom_square.current_row]
        
                (piece.current_row + 1).upto(board_size - 1) do |row|
                    column = piece.current_column - (piece.current_row - row)
                    break if column < 0
        
                    square = get_piece_at(column, row)

                    if square.nil?
                        invalid_moves << [column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end
        
            if right_diagonal_bottom_square
                invalid_moves << [right_diagonal_bottom_square.current_column, right_diagonal_bottom_square.current_row]
        
                (piece.current_row + 1).upto(board_size - 1) do |row|
                    column = piece.current_column + (piece.current_row - row)
                    break if column >= board_size
                
                    square = get_piece_at(column, row)

                    if square.nil?
                        invalid_moves << [column, row]

                    elsif square
                        invalid_moves << [square.current_column, square.current_row]
                    end
                end
            end
        end

        return invalid_moves
    end

    def move_piece(new_column, new_row, old_column, old_row)
        if @current_player == @player_one
            piece = get_piece_at(old_column, old_row)
            return unless piece

            invalid_moves = get_move_path(old_column, old_row)

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
                    opponent_piece = find_piece_on_board(@player_two_double_move_pawn)
        
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
                    king = find_piece_on_board(@player_one_king)
                    rook_1 = find_piece_on_board(@player_one_rook_1)
                    rook_2 = find_piece_on_board(@player_one_rook_2)
                    
                    puts "king piece = #{king.name} "
                    puts "king current column = #{king.current_column} "
                    puts "rook 1 piece = #{rook_1.name} "
                    puts "rook 2 piece = #{rook_2.name} "
        
                    if king && king.current_row == 0
                        @left_king_castling_column = king.current_column - 2
                        @right_king_castling_column = king.current_column + 2
                        @left_king_castling_move = []
                        @right_king_castling_move = []
                        @left_king_castling_move << [@left_king_castling_column, king.current_row]
                        @right_king_castling_move << [@right_king_castling_column, king.current_row]
                    end

                    if rook_1 && rook_1.current_row == 0
                        @rook_1_castling_column = rook_1.current_column + 3 
                        @rook_1_castling_move << [@rook_1_castling_column, rook_1.current_row]
                    end

                    if rook_2 && rook_1.current_row == 0
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

                puts "valid moves = #{valid_moves}"
                puts "invalid moves = #{invalid_moves}"
                valid_moves.reject! { |move| invalid_moves.include?(move) }
                puts "valid moves = #{valid_moves}"

                same_piece_color = same_color_piece?(new_column, new_row)
                puts "same piece = #{same_piece_color}"

                if piece&.name&.match?(/Pawn/i)
                    possible_pawn_capture = pawn_diagonal_capture(old_column, old_row) 

                    if !possible_pawn_capture.nil?   
                        valid_moves += possible_pawn_capture
                    end
                end

                if piece&.name&.match?(/Pawn/i) && valid_moves.include?([new_column, new_row]) && new_row == 7
                    puts "possible promtion available"
                    piece.current_column = new_column
                    piece.current_row = new_row

                    if piece.current_row == 7
                        puts "promotion is possible"
        
                        puts "#{@player_two_name}, choose the piece for pawn promotion (queen, king, rook, bishop, knight):"
                        piece_choice = gets.chomp.downcase
        
                        until ['queen', 'king', 'rook', 'bishop', 'knight'].include?(piece_choice)
                            puts "Invalid piece choice for promotion."
                        end
        
                        new_piece = case piece_choice
                        when 'king'
                            ChessPiece.new("Black King 3", "\u265A", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        when 'queen'
                            ChessPiece.new("Black Queen", "\u265B", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        when 'rook'
                            ChessPiece.new("Black Rook", "\u265C", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        when 'bishop'
                            ChessPiece.new("Black Bishop", "\u265D", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        when 'knight'
                            ChessPiece.new("Black Knight", "\u265E", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        end
        
                        replace_piece(piece, new_piece)
                        puts "#{@player_two_name} promotes a pawn to a #{piece_choice.capitalize} at #{new_column}, #{new_row}."
                        @player_two_pieces << new_piece
                        

                        new_piece.current_column = new_column
                        new_piece.current_row = new_row
        
                        update_board(new_piece.current_column, new_piece.current_row, old_column, old_row)
                        @player_two_pieces.delete(piece)
                        return new_piece
                    end
                end
                
                # Remove empty arrays from valid_moves
                #valid_moves.reject!(&:empty?)

                if valid_moves.include?([new_column, new_row]) && @en_passant_possible == false && same_piece_color == false
                    capture_piece(old_column, old_row, new_column, new_row) unless ENV['SKIP_CAPTURE_PIECE']
                    piece.current_column = new_column
                    piece.current_row = new_row
                    puts "Moved #{piece.name} to column #{new_column}, row #{new_row}"

                    if piece&.name&.match?(/King/i)
                        @player_one_king_moved = true
                    elsif piece&.name&.match?(/Rook/i)
                        @player_one_rook_moved = true
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

                elsif valid_moves.include?(@left_king_castling_move) || valid_moves.include?(@right_king_castling_move)
                    piece.current_column = new_column
                    piece.current_row = new_row

                    puts "#{@player_one_name} moved #{piece.name} to column #{piece.current_column}, row #{0} via castling"

                    update_board(piece.current_column, piece.current_row, old_column, old_row)
    
                    if piece.current_column == @left_king_castling_column
                        rook_1.current_column = @rook_1_castling_column
                        rook_1.current_row = rook_1.current_row

                        puts "#{@player_one_name} moved #{rook_1.name} to column #{rook_1.current_column}, row #{0} via castling"

                        update_board(rook_1.current_column, 0, 0, 0)
    
                    elsif piece.current_column == @right_king_castling_column
                        rook_2.current_column = @rook_2_castling_column
                        rook_2.current_row = 0

                        puts "#{@player_one_name} moved #{rook_2.name} to column #{rook_2.current_column}, row #{0} via castling"

                        update_board(rook_2.current_column, 0, 7, 0)
                    end
    
                    @player_one_king_moved = true
                    @player_one_rook_moved = true
    
                    
                    display_updated_board
                    switch_players

                elsif same_piece_color == true
                    same_piece_color_illegal_move
                else
                    illegal_move
                end
            else
                puts "Illegal selection, select a white piece!"
            end

        elsif @current_player == @player_two
            piece = get_piece_at(old_column, old_row)
            return unless piece

            invalid_moves = get_move_path(old_column, old_row)

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
                    opponent_piece = find_piece_on_board(@player_one_double_move_pawn)
        
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
                    king = find_piece_on_board(@player_two_king)
                    rook_1 = find_piece_on_board(@player_two_rook_1)
                    rook_2 = find_piece_on_board(@player_two_rook_2)
                    
                    puts "king piece = #{king.name} "
                    puts "king current column = #{king.current_column} "
                    puts "rook 1 piece = #{rook_1.name} "
                    puts "rook 2 piece = #{rook_2.name} "
        
                    if king && king.current_row == 7
                        @left_king_castling_column = king.current_column - 2
                        @right_king_castling_column = king.current_column + 2
                        @left_king_castling_move = []
                        @right_king_castling_move = []
                        @left_king_castling_move << [@left_king_castling_column, 7]
                        @right_king_castling_move << [@right_king_castling_column, 7]
                    end

                    if rook_1 && rook_1.current_row == 7
                        @rook_1_castling_column = rook_1.current_column + 3 
                        @rook_1_castling_move << [@rook_1_castling_column, 7]
                    end

                    if rook_2 &&  rook_2.current_row == 7
                        @rook_2_castling_column = rook_2.current_column - 2
                        @rook_2_castling_move << [@rook_2_castling_column, 7]
                    end

                    valid_moves << @left_king_castling_move
                    valid_moves << @right_king_castling_move

                    puts "left_king_castling_column = #{@left_king_castling_column} "
                    puts "right_king_castling_column = #{@right_king_castling_column} "
                    puts "left_king_castling_move = #{@left_king_castling_move} "
                    puts "right_king_castling_move = #{@right_king_castling_move} "

                    puts "rook_1_castling_column = #{@rook_1_castling_column} "
                    puts "rook_1_castling_move = #{@rook_1_castling_move} "
                    puts "rook_2_castling_column = #{@rook_2_castling_column} "
                    puts "rook_2_castling_move = #{@rook_2_castling_move} "
                end

                puts "valid moves = #{valid_moves}"
                puts "invalid moves = #{invalid_moves}"
                valid_moves.reject! { |move| invalid_moves.include?(move) }
                puts "valid moves = #{valid_moves}"

                same_piece_color = same_color_piece?(new_column, new_row)
                puts "same piece = #{same_piece_color}"

                if piece&.name&.match?(/Pawn/i)
                    possible_pawn_capture = pawn_diagonal_capture(old_column, old_row) 

                    if !possible_pawn_capture.nil?   
                        valid_moves += possible_pawn_capture
                    end
                end

                if piece&.name&.match?(/Pawn/i) && valid_moves.include?([new_column, new_row]) && new_row == 0
                    puts "possible promtion available"
                    piece.current_column = new_column
                    piece.current_row = new_row

                    if piece.current_row == 0
                        puts "promotion is possible"
        
                        puts "#{@player_two_name}, choose the piece for pawn promotion (queen, king, rook, bishop, knight):"
                        piece_choice = gets.chomp.downcase
        
                        until ['queen', 'king', 'rook', 'bishop', 'knight'].include?(piece_choice)
                            puts "Invalid piece choice for promotion."
                        end
        
                        new_piece = case piece_choice
                        when 'king'
                            ChessPiece.new("Black King 3", "\u265A", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        when 'queen'
                            ChessPiece.new("Black Queen", "\u265B", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        when 'rook'
                            ChessPiece.new("Black Rook", "\u265C", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        when 'bishop'
                            ChessPiece.new("Black Bishop", "\u265D", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        when 'knight'
                            ChessPiece.new("Black Knight", "\u265E", piece.start_column, piece.start_row, new_column, new_row, @player_two_color)
                        end
        
                        replace_piece(piece, new_piece)
                        puts "#{@player_two_name} promotes a pawn to a #{piece_choice.capitalize} at #{new_column}, #{new_row}."
                        @player_two_pieces << new_piece
                        

                        new_piece.current_column = new_column
                        new_piece.current_row = new_row
        
                        update_board(new_piece.current_column, new_piece.current_row, old_column, old_row)
                        @player_two_pieces.delete(piece)
                        return new_piece
                    end
                end

                puts "valid moves #{valid_moves}"
                # Remove empty arrays from valid_moves
                valid_moves.reject!(&:empty?)
    
                if valid_moves.include?([new_column, new_row]) && @en_passant_possible == false && same_piece_color == false 
                    capture_piece(old_column, old_row, new_column, new_row) unless ENV['SKIP_CAPTURE_PIECE'] 
                    piece.current_column = new_column
                    piece.current_row = new_row
                    pawn_promotion(piece.current_column, piece.current_row)
                    puts "Moved #{piece.name} to column #{new_column}, row #{new_row}"

                    if piece&.name&.match?(/King/i)
                        @player_two_king_moved = true
                    elsif piece&.name&.match?(/Rook/i)
                        @player_two_rook_moved = true
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

                elsif valid_moves.include?(@left_king_castling_move) || valid_moves.include?(@right_king_castling_move)
                    piece.current_column = new_column
                    piece.current_row = new_row
    
                    update_board(piece.current_column, piece.current_row, old_column, old_row)
    
                    if piece.current_column == @left_king_castling_column
                        rook_1.current_column = @rook_1_castling_column
                        rook_1.current_row = 7

                        puts "Moved #{piece.name} to column #{new_column}, row #{new_row} via castling"
                        puts "#{@player_two_name} moved #{rook_1.name} to column #{rook_1.current_column}, row #{7} via castling"

                        update_board(rook_1.current_column, 7, 0, 7)
    
                    elsif piece.current_column == @right_king_castling_column
                        rook_2.current_column = @rook_2_castling_column
                        rook_2.current_row = 7

                        puts "Moved #{piece.name} to column #{new_column}, row #{new_row} via castling"
                        puts "#{@player_two_name} moved #{rook_2.name} to column #{rook_1.current_column}, row #{7} via castling"

                        update_board(rook_2.current_column, 7, 7, 7)
                    end

                    @player_two_king_moved = true
                    @player_two_rook_moved = true
                    
                    display_updated_board
                    switch_players

                elsif same_piece_color == true
                    same_piece_color_illegal_move
                else
                    illegal_move
                end
            else
                puts "Illegal selection, select a black piece!"
            end
        end
    end

    def castling_possible?
        if @current_player == @player_one
            return false if @player_one_king_moved == true || @player_one_rook_moved == true
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
                @castling_possible = true
                puts "Castling is possible"
            end
             
            return false

        elsif @current_player == @player_two
            return false if @player_two_king_moved == true || @player_two_rook_moved == true
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
                @castling_possible = true
                puts "Castling is possible"
            end

            return false
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
            
            return unless pawn && pawn.current_row == 7

            piece_color = @player_one_color

            puts "#{@player_one_name}, choose the piece for pawn promotion (queen, king, rook, bishop, knight):"
            piece_choice = gets.chomp.downcase

            until ['queen', 'king', 'rook', 'bishop', 'knight'].include?(piece_choice)
                puts "Invalid piece choice for promotion."
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
            @player_one_pieces << new_piece
            @player_one_pieces.delete(pawn)

            return new_piece

        elsif @current_player == @player_two
            pawn = retrieve_pawn(current_column, current_row)
            
            if pawn && pawn.current_row == 0
                puts "promotion is possible"

                puts "#{@player_two_name}, choose the piece for pawn promotion (queen, king, rook, bishop, knight):"
                piece_choice = gets.chomp.downcase

                until ['queen', 'king', 'rook', 'bishop', 'knight'].include?(piece_choice)
                    puts "Invalid piece choice for promotion."
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
                @player_two_pieces << new_piece
                @player_two_pieces.delete(pawn)

                update_board(new_piece.current_column, new_piece.current_row, current_column, current_row)
                display_updated_board
                return new_piece
            end
        end
    end

    def king_in_check?
        if @current_player == @player_one
            king_piece = find_piece_on_board(@player_one_king)
            opponent_pieces = @player_two_pieces

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
                    puts "king is in check"
                    return true
                end
            end
        
        elsif @current_player == @player_two
            king_piece = find_piece_on_board(@player_two_king)
            opponent_pieces = @player_one_pieces

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
                    puts "king is in check"
                    return true
                end
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

    def same_piece_color_illegal_move
        puts "Illegal move, cannot move to a destination occupied by your own piece, make another move"
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
            query_save_game
            check_winner
        end
    end

    def play_game
        assign_players
        setup_board
        scan_board
        make_move
    end

    def query_save_game
        if check_winner == false
            puts "Do you want to save the game? Type 'yes' or 'no'"
            input = gets.chomp.downcase
      
            until input == "yes" || input == "no"
                puts "Invalid input. Do you want to save the game? Type 'yes' or 'no'"
                input = gets.chomp.downcase
            end
      
            if input == 'yes'
                save_game
            end
        end
    end

    #def save_game
        saved_data = {
            
            board: @board,
            
            player_one: @player_one,
            player_two: @player_two,
            player_one_name: @player_one_name,
            player_two_name: @player_two_name,
            player_one_king: @player_one_king,
            player_two_king: @player_two_king,
            player_one_rook_1: @player_one_rook_1,
            player_one_rook_2: @player_one_rook_2,
            player_two_rook_1: @player_two_rook_1,
            player_two_rook_2: @player_two_rook_2,
            player_one_color: @player_one_color,
            player_two_color: @player_two_color,
            current_player: @current_player,
            pieces_captured_by_player_one: @pieces_captured_by_player_one,
            player_one_pieces_remaining: @player_one_pieces_remaining,
            pieces_captured_by_player_two: @pieces_captured_by_player_two,
            player_two_pieces_remaining: @player_two_pieces_remaining,
            player_one_pieces: serialize_pieces(@player_one_pieces),
            player_two_pieces: serialize_pieces(@player_two_pieces),
            left_king_castling_column: @left_king_castling_column,
            right_king_castling_column: @right_king_castling_column,
            left_king_castling_move: @left_king_castling_move,
            right_king_castling_move: @right_king_castling_move,
            rook_1_castling_column: @rook_1_castling_column,
            rook_1_castling_move: @rook_1_castling_move,
            rook_2_castling_column: @rook_2_castling_column,
            rook_2_castling_move: @rook_2_castling_move,
            player_one_double_move_made: @player_one_double_move_made,
            player_two_double_move_made: @player_two_double_move_made,
            player_one_double_move_pawn: @player_one_double_move_pawn,
            player_two_double_move_pawn: @player_two_double_move_pawn,
            en_passant_possible: @en_passant_possible,
            en_passant_move: @en_passant_move,
            en_passant_piece: @en_passant_piece,
            captured_en_passant: @captured_en_passant,
            in_check: @in_check,
            checkmate: @checkmate,
            player_one_king_moved: @player_one_king_moved,
            player_one_rook_moved: @player_one_rook_moved,
            player_two_king_moved: @player_two_king_moved,
            player_two_rook_moved: @player_two_rook_moved,
            square_under_attack: @square_under_attack,
            insufficient_material: @insufficient_material,
            castling_attempted: @castling_attempted,
            castling_possible: @castling_possible
        }

        File.open('chess_save.json', 'w') do |file|
            file.puts JSON.pretty_generate(saved_data)
        end

        puts "Game saved successfully"
    end

    #def serialize_pieces(pieces)
        pieces.map(&:to_json)
      end
      
      def deserialize_pieces(serialized_pieces)
        serialized_pieces.map do |piece_json|
          piece_data = JSON.parse(piece_json, symbolize_names: true)
          ChessPiece.new(
            piece_data[:name],
            piece_data[:unicode],
            piece_data[:start_column],
            piece_data[:start_row],
            piece_data[:current_column],
            piece_data[:current_row],
            piece_data[:color]
          )
        end
    #end

    #def load_game
        file_path = 'chess_save.json'

        if File.exist?(file_path)
            saved_data = JSON.parse(File.read(file_path), symbolize_names: true)

            @board = saved_data[:board]
            

            @player_one = saved_data[:player_one]
            @player_two = saved_data[:player_two]
            @player_one_name = saved_data[:player_one_name]
            @player_two_name = saved_data[:player_two_name]
            @player_one_king = saved_data[:player_one_king]
            @player_two_king = saved_data[:player_two_king]
            @player_one_rook_1 = saved_data[:player_one_rook_1]
            @player_one_rook_2 = saved_data[:player_one_rook_2]
            @player_two_rook_1 = saved_data[:player_two_rook_1]
            @player_two_rook_2 = saved_data[:player_two_rook_2]
            @player_one_color = saved_data[:player_one_color]
            @player_two_color = saved_data[:player_two_color]
            @current_player = saved_data[:current_player]
            @pieces_captured_by_player_one = saved_data[:pieces_captured_by_player_one]
            @player_one_pieces_remaining = saved_data[:player_one_pieces_remaining]
            @pieces_captured_by_player_two = saved_data[:pieces_captured_by_player_two]
            @player_two_pieces_remaining = saved_data[:player_two_pieces_remaining]
            @player_one_pieces = deserialize_pieces(saved_data[:player_one_pieces])
            @player_two_pieces = deserialize_pieces(saved_data[:player_two_pieces])
            @left_king_castling_column = saved_data[:left_king_castling_column]
            @right_king_castling_column = saved_data[:right_king_castling_column]
            @left_king_castling_move = saved_data[:left_king_castling_move]
            @right_king_castling_move = saved_data[:right_king_castling_move]
            @rook_1_castling_column = saved_data[:rook_1_castling_column]
            @rook_1_castling_move = saved_data[:rook_1_castling_move]
            @rook_2_castling_column = saved_data[:rook_2_castling_column]
            @rook_2_castling_move = saved_data[:rook_2_castling_move]
            @player_one_double_move_made = saved_data[:player_one_double_move_made]
            @player_two_double_move_made = saved_data[:player_two_double_move_made]
            @player_one_double_move_pawn = saved_data[:player_one_double_move_pawn]
            @player_two_double_move_pawn = saved_data[:player_two_double_move_pawn]
            @en_passant_possible = saved_data[:en_passant_possible]
            @en_passant_move = saved_data[:en_passant_move]
            @en_passant_piece = saved_data[:en_passant_piece]
            @captured_en_passant = saved_data[:captured_en_passant]
            @in_check = saved_data[:in_check]
            @checkmate = saved_data[:checkmate]
            @player_one_king_moved = saved_data[:player_one_king_moved]
            @player_one_rook_moved = saved_data[:player_one_rook_moved]
            @player_two_king_moved = saved_data[:player_two_king_moved]
            @player_two_rook_moved = saved_data[:player_two_rook_moved]
            @square_under_attack = saved_data[:square_under_attack]
            @insufficient_material = saved_data[:insufficient_material]
            @castling_attempted = saved_data[:castling_attempted]
            @castling_possible = saved_data[:castling_possible]
      
            puts "Game loaded successfully"

            #scan_board_2
            #recreated_pieces_1 = @player_one_pieces.map do |serialized_piece|
                ChessPiece.new(
                  serialized_piece[:name],
                  serialized_piece[:unicode],
                  serialized_piece[:start_column],
                  serialized_piece[:start_row],
                  serialized_piece[:current_column],
                  serialized_piece[:current_row],
                  serialized_piece[:color]
                )
            end
            #@player_one_pieces = recreated_pieces_1
            #recreated_pieces_2 = @player_two_pieces.map do |serialized_piece|
                ChessPiece.new(
                  serialized_piece[:name],
                  serialized_piece[:unicode],
                  serialized_piece[:start_column],
                  serialized_piece[:start_row],
                  serialized_piece[:current_column],
                  serialized_piece[:current_row],
                  serialized_piece[:color]
                )
            #end
            #@player_two_pieces = recreated_pieces_2
            #puts @player_one_pieces[0]
            #puts @player_two_pieces[0]
            setup_pieces(@player_one_pieces)
            setup_pieces(@player_two_pieces)
            #display_updated_board
            make_move
        else
            puts "No saved game found"
        end
    end
end


game = ChessBoard.new
game.display_board
hoe = ChessGame.new
#hoe.play_game