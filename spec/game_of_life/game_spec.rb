require 'spec_helper'

describe GameOfLife::Game do
  it 'runs a game' do
    game = GameOfLife::Game.new(initial_state: [
      [0,0,0],
      [0,0,0],
      [0,0,0],
    ])
    game.tick!
    expect(game.board.to_a).to eq([
      [0,0,0],
      [0,0,0],
      [0,0,0],
    ])
    expect(game).to be_over
  end

  it "isn't immediately over" do
    game = GameOfLife::Game.new(initial_state: [
      [1,1,0],
      [1,0,0],
      [0,0,0],
    ])
    expect(game).not_to be_over
  end

end
