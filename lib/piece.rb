class Piece
  attr_reader :color, :board
  
  def initialize(board, color)
    @board = board
    @color = color
  end

  def enemy?(location)
    !board[location].nil? && board[location].color != color
  end
end