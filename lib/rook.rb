class Rook < Piece
  include Slideable
  
  def move_directions
    [
      [0, 1], [0, -1], [1, 0], [-1, 0]
    ]
  end

  def to_s
    color == :black ? "♜" : "♖"
  end
end