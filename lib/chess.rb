class Player
    attr_reader :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end
end

class Chessboard
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
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
        puts "8 |   #{"\u2656"}   |   #{"\u2658"}   |   #{"\u2657"}   |   #{"\u2655"}   |   #{"\u2654"}   |   #{"\u2657"}   |   #{"\u2658"}   |   #{"\u2656"}   |"
        puts seperator
        puts "7 |   #{"\u2659"}   |   #{"\u2659"}   |   #{"\u2659"}   |   #{"\u2659"}   |   #{"\u2659"}   |   #{"\u2659"}   |   #{"\u2659"}   |   #{"\u2659"}   |"
        puts seperator
        puts "6 |   #{label_at(16)}  |   #{label_at(17)}  |   #{label_at(18)}  |   #{label_at(19)}  |   #{label_at(20)}  |   #{label_at(21)}  |   #{label_at(22)}  |   #{label_at(23)}  |"
        puts seperator
        puts "5 |   #{label_at(24)}  |   #{label_at(25)}  |   #{label_at(26)}  |   #{label_at(27)}  |   #{label_at(28)}  |   #{label_at(29)}  |   #{label_at(30)}  |   #{label_at(31)}  |"
        puts seperator
        puts "4 |   #{label_at(32)}  |   #{label_at(33)}  |   #{label_at(34)}  |   #{label_at(35)}  |   #{label_at(36)}  |   #{label_at(37)}  |   #{label_at(38)}  |   #{label_at(39)}  |"
        puts seperator
        puts "3 |   #{label_at(40)}  |   #{label_at(41)}  |   #{label_at(42)}  |   #{label_at(43)}  |   #{label_at(44)}  |   #{label_at(45)}  |   #{label_at(46)}  |   #{label_at(47)}  |"
        puts seperator
        puts "2 |   #{"\u265F"}   |   #{"\u265F"}   |   #{"\u265F"}   |   #{"\u265F"}   |   #{"\u265F"}   |   #{"\u265F"}   |   #{"\u265F"}   |   #{"\u265F"}   |"
        puts seperator
        puts "1 |   #{"\u265C"}   |   #{"\u265E"}   |   #{"\u265D"}   |   #{"\u265B"}   |   #{"\u265A"}   |   #{"\u265D"}   |   #{"\u265E"}   |   #{"\u265C"}   |"
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

class ChessPiece
    attr_reader :name, :unicode

    def initialize(name, unicode)
        @name = name
        @unicode = unicode
    end

    class << self
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

    black_pawn = ChessPiece::BLACK_PAWN
    black_knight = ChessPiece::BLACK_KNIGHT
    black_bishop = ChessPiece::BLACK_BISHOP
    black_rook = ChessPiece::BLACK_ROOK
    black_king = ChessPiece::BLACK_KING
    black_queen = ChessPiece::BLACK_QUEEN

    white_pawn = ChessPiece::WHITE_PAWN
    white_knight = ChessPiece::WHITE_KNIGHT
    white_bishop = ChessPiece::WHITE_BISHOP
    white_rook = ChessPiece::WHITE_ROOK
    white_king = ChessPiece::WHITE_KING
    white_queen = ChessPiece::WHITE_QUEEN


    def pawn_movement(column, row, color)
        moves = []

        direction = (color == :white) ? 1 : -1

        moves << [column, row + direction]

        # Double move on the first turn
        if ((color == :white && row == 1) || (color == :black && row == 6))
            moves << [column, row + 2 * direction]
        end

        moves.select { |move| valid_move?(move) }
    end

    def valid_move?(move)
        move.all? { |coord| coord.between?(0, 7) }
    end
end

game = Chessboard.new
game.display_board