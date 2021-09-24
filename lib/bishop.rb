class Bishop < Piece
  def move_directions
    [
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end

  def to_s
    color == :black ? "♝" : "♗"
  end
end