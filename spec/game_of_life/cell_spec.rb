require 'spec_helper'

describe GameOfLife::Cell do
  describe "tick" do
    it "Any live cell with fewer than two live neighbours dies" do
      expect(GameOfLife::Cell.new(1, [1,0,0,0]).tick).to eq(0)
    end

    it "Any live cell with more than three live neighbours dies" do
      expect(GameOfLife::Cell.new(1, [1,1,1,1]).tick).to eq(0)
    end

    it "Any live cell with two or three live neighbours lives on to the next generation." do
      expect(GameOfLife::Cell.new(1, [1,1,1,0]).tick).to eq(1)
    end

    it "Any dead cell with exactly three live neighbours becomes a live cell." do
      expect(GameOfLife::Cell.new(0, [1,1,1,0]).tick).to eq(1)
    end
  end
end
