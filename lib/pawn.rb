class Pawn < Piece
  def forward_direction
    color == :black ? 1 : -1
  end  

  def available_moves
    moves = []

    current_row, current_column = location
    one_forward = [current_row + forward_direction, current_column]
    if board.empty?(one_forward)
      moves << one_forward
    end

    two_forward = [current_row + (forward_direction * 2), current_column]
    if board.empty?(two_forward)
      moves << two_forward
    end
    
    diagonal_left = [current_row + forward_direction, current_column + 1]
    diagonal_right = [current_row + forward_direction, current_column - 1]
    if enemy?(diagonal_left)
      moves << diagonal_left
    end
    if enemy?(diagonal_right)
      moves << diagonal_right
    end

    moves.select { |move| board.in_bounds?(move) }
  end

  def move_directions
    [[0, 1]]
  end

  def to_s
    color == :black ? "♟︎" : "♙"
  end
end