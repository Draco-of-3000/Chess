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

    private

    def setup_pieces(color)
        major_pieces = color == :white ? 7 : 0
        pawns = color == :white ? 6 : 1

        @board[major_pieces_rank] = Array.new(8,
            (color == :white ? ["\u2656", "\u2658", "\u2657", "\u2655", "\u2654", "\u2657", "\u2658", "\u2656"] :
                               ["\u265C", "\u265E", "\u265D", "\u265B", "\u265A", "\u265D", "\u265E", "\u265C"])
          )

        @board[pawns] = Array.new(8, color == :white ? "\u2659" : "\u265F")
    end
end