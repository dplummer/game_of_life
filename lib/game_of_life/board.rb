module GameOfLife
  class Board
    def initialize(board)
      @board = board
    end

    def inspect
      "GameOfLife::Board.new(#{to_a})"
    end

    def to_a
      @board
    end

    def ==(o)
      o.to_a == to_a
    end

    def tick
      self.class.new(cells.map {|row| row.map(&:tick)})
    end

    def neighbors_for(row_i, col_i)
      [
        neighbor_at(row_i, col_i - 1),
        neighbor_at(row_i, col_i + 1),
        neighbor_at(row_i - 1, col_i),
        neighbor_at(row_i + 1, col_i)
      ]
    end

    def cells
      map_with_index(@board) do |row, row_index|
        map_with_index(row) do |cell, cell_index|
          Cell.new(cell, neighbors_for(row_index, cell_index))
        end
      end
    end

    private

    def neighbor_at(row_i, col_i)
      if row_i < 0 || col_i < 0
        0
      else
        @board.fetch(row_i, []).fetch(col_i, 0)
      end
    end

    def map_with_index(array)
      result = []
      array.each_with_index do |elem, index|
        result << yield(elem, index)
      end
      result
    end
  end
end
