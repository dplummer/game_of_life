module GameOfLife
  class Game
    attr_reader :board

    def initialize(width: 100, height: 100, initial_state: nil)
      if initial_state
        @board = Board.new(initial_state)
      else
        @board = Board.new(generate_random_board(width: width, height: height))
      end
    end

    def inspect
      "GameOfLife::Game.new(initial_state: #{@board.to_a})"
    end

    def tick!
      @board = @board.tick
    end

    def over?
      @board == @board.tick
    end

    private

    def generate_random_board(width:, height:)
      result = []

      height.times do
        new_row = []
        width.times do
          new_row << rand(2)
        end
        result << new_row
      end

      result
    end
  end
end
