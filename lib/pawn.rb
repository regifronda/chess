class Pawn < Piece
  def forward_direction
    color == :black ? 1 : -1
  end  

  def move_directions
    [[0, 1]]
  end

  def to_s
    color == :black ? "♟︎" : "♙"
  end
end