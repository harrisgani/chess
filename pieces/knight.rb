# -*- coding: utf-8 -*-

require_relative 'stepping_piece'

class Knight < SteppingPiece
  def symbols
    { :white => '♘', :black => '♞' }
  end

  protected
  def move_diffs
    [ [-2, -1],
      [-2,  1],
      [-1, -2],
      [-1,  2],
      [ 1, -2],
      [ 1,  2],
      [ 2, -1],
      [ 2,  1] ]
  end
end
