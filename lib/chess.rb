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

        @board[major_pieces] = Array.new(8, [
            color == :white ? "\u2656" : "\u265C", "\u2658" : "\u265E", "\u2657" : "\u265D", 
            "\u2655" : "\u265B", "\u2654" : "\u265A", "\u2657" : "\u265D", "\u2658" : "\u265E", "\u2656" : "\u265C"
        ])

        @board[pawns] = Array.new(8, color == :white ? "\u2659" : "\u265F")
    end
end