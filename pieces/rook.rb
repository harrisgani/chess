# -*- coding: utf-8 -*-

require_relative 'sliding_piece'

class Rook < SlidingPiece
  def symbols
    { :white => '♖', :black => '♜' }
  end

  protected
  def move_dirs
    SlidingPiece::HORIZONTAL_DIRS
  end
end
