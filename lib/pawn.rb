class Pawn < Piece
  def move_directions
    [[0, 1]]
  end

  def to_s
    color == :black ? "♟︎" : "♙"
  end
end