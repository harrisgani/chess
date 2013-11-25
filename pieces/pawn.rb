# -*- coding: utf-8 -*-

require_relative 'piece'

class Pawn < Piece
  def symbols
    { :white => '♙', :black => '♟' }
  end

  def moves
    forward_steps + side_attacks
  end

  private
  def at_start_row?
    pos[0] == ((color == :white) ? 6 : 1)
  end

  def forward_dir
    (color == :white) ? -1 : 1
  end

  def forward_steps
    steps = []

    i, j = pos
    one_step = [i + forward_dir, j]
    if board.valid_pos?(one_step) && board.empty?(one_step)
      steps << one_step

      two_step = [i + 2 * forward_dir, j]
      if at_start_row? && board.empty?(two_step)
        steps << two_step
      end
    end

    steps
  end

  def side_attacks
    i, j = pos

    side_moves = [[i + forward_dir, j - 1], [i + forward_dir, j + 1]]

    side_moves.select do |new_pos|
      next false unless board.valid_pos?(new_pos)

      threatened_piece = board[new_pos]
      threatened_piece && threatened_piece.color != self.color
    end
  end
end
