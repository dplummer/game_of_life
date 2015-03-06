module GameOfLife
  class Cell
    def initialize(current, neighbors)
      @current = current
      @neighbors = neighbors
    end

    def alive?
      @current == 1
    end

    def dead?
      @current == 0
    end

    def tick
      case @neighbors.inject(&:+)
      when ->(i) { i < 2 }
        0
      when ->(i) { i > 3 }
        0
      when ->(i) { i == 2 && alive? }
        1
      when ->(i) { i == 3 }
        1
      else
        0
      end
    end
  end
end
