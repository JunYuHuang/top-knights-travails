require_relative 'spec_helper'
require_relative 'index'

RSpec.describe "index" do
  describe "knights_move" do
    it "returns an empty array if called with ([-1,-1], [0,0])" do
      res = knights_moves([-1,-1], [0,0])
      expect(res).to eq([])
    end

    it "returns an empty array if called with ([0,0], ['a','b'])" do
      res = knights_moves([-1,-1], ['a','b'])
      expect(res).to eq([])
    end

    it "returns an [[0,0],[0,0]] if called with ([0,0], [0,0])" do
      res = knights_moves([0,0], [0,0])
      expect(res).to eq([[0,0],[0,0]])
    end

    it "returns an [[0,0],[1,2]] if called with ([0,0], [1,2])" do
      res = knights_moves([0,0], [1,2])
      expect(res).to eq([[0,0],[1,2]])
    end

    it "returns one of the valid answers if called with ([0,0], [3,3])" do
      expected = Set.new([
        [[0,0], [1,2], [3,3]],
        [[0,0], [2,1], [3,3]],
      ])
      res = knights_moves([0,0], [3,3])
      expect(res.size).to eq(3)
      expect(expected.include?(res)).to eq(true)
    end

    it "returns one of the valid answers if called with ([3,3], [0,0])" do
      expected = Set.new([
        [[3,3], [1,2], [0,0]],
        [[3,3], [2,1], [0,0]],
      ])
      res = knights_moves([3,3], [0,0])
      expect(res.size).to eq(3)
      expect(expected.include?(res)).to eq(true)
    end

    it "returns one of the valid answers if called with ([3,3], [4,3])" do
      res = knights_moves([3,3], [4,3])
      puts("\n#{res.to_s}")
      expect(res.size).to eq(4)
      expect(res[0]).to eq([3,3])
      expect(res[-1]).to eq([4,3])
    end
  end
end
