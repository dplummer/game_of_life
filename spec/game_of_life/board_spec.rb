require 'spec_helper'

describe GameOfLife::Board do
  describe "#tick" do
    it "Any live cell with fewer than two live neighbours dies" do
      expect(GameOfLife::Board.new([[0,1,0]]).tick).
        to eq(GameOfLife::Board.new([[0,0,0]]))
    end

    it "Any live cell with more than three live neighbours dies" do
      expect(GameOfLife::Board.new([[1,1,1],
                                    [1,1,1],
                                    [1,1,1]]).tick).
        to eq(GameOfLife::Board.new([[1,1,1],
                                     [1,0,1],
                                     [1,1,1]]))
    end

    it "Any live cell with two or three live neighbours lives on to the next generation." do
      expect(GameOfLife::Board.new([[1,1],
                                    [1,1]]).tick).
        to eq(GameOfLife::Board.new([[1,1],
                                     [1,1]]))
    end

    it "Any dead cell with exactly three live neighbours becomes a live cell." do
      expect(GameOfLife::Board.new([[0,1,0],
                                    [1,0,1]]).tick).
        to eq(GameOfLife::Board.new([[0,0,0],
                                     [0,1,0]]))
    end
  end

  describe "neighbors_for" do
    it "returns the neighbors for a cell in the center" do
      expect(GameOfLife::Board.new([[0,1,0],
                                    [1,0,1],
                                    [0,1,0]]).neighbors_for(1,1)).
        to eq([1,1,1,1])
    end

    it "returns the neighbors for a cell in the top left" do
      expect(GameOfLife::Board.new([[0,1,0],
                                    [1,0,1],
                                    [0,1,0]]).neighbors_for(0,0)).
        to eq([0,1,0,1])
    end

    it "returns the neighbors for a cell in the top right" do
      expect(GameOfLife::Board.new([[0,1,0],
                                    [1,0,1],
                                    [0,1,0]]).neighbors_for(0,2)).
        to eq([1,0,0,1])
    end

    it "returns the neighbors for a cell in the bottom left" do
      expect(GameOfLife::Board.new([[0,1,0],
                                    [1,0,1],
                                    [0,1,0]]).neighbors_for(2,0)).
        to eq([0,1,1,0])
    end

    it "returns the neighbors for a cell in the bottom right" do
      expect(GameOfLife::Board.new([[0,1,0],
                                    [1,0,1],
                                    [0,1,0]]).neighbors_for(2,2)).
        to eq([1,0,1,0])
    end

     it "works with a 2x2 array" do
      expect(GameOfLife::Board.new([[1,1],
                                    [1,1]]).neighbors_for(0,0)).
        to eq([0,1,0,1])
     end
  end
end
