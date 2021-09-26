class Piece
  attr_reader :color, :board
  
  def initialize(board, color)
    @color = color
  end
end