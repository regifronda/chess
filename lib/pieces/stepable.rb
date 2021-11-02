module Stepable
  def available_moves
    moves = []

    move_directions.each do |(row_difference, column_difference)|
      current_row, current_column = location
      
      current_row += row_difference
      current_column += column_difference
      loc = [current_row, current_column]
      next if !board.in_bounds?(loc)
      
      if board.empty?(loc) || enemy?(loc)
        moves << loc
      end     
    end
    moves
  end
end