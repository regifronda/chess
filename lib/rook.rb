class Rook < Piece
  def move_directions
    [
      [0, 1], [0, -1], [1, 0], [-1, 0]
    ]
  end

  def available_moves
    moves = []

    move_directions.each do |(row_difference, column_difference)|
      current_row, current_column = location
      
      loop do
        current_row += row_difference
        current_column += column_difference
        loc = [current_row, current_column]
        break if !board.in_bounds?(loc)

        if board.empty?(loc)
          moves << loc
        end
        
        if enemy?(loc)
          moves << loc
          break
        end
      end
      # until we hit a piece
        # add the location + difference in column/row to moves
    end
    moves
  end

  def to_s
    color == :black ? "♜" : "♖"
  end
end