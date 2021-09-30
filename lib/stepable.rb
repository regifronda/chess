module Stepable
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
    end
    moves
  end
end