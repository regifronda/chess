class Piece
  attr_reader :color, :board
  attr_accessor :location
  
  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
  end

  def enemy?(location)
    !board[location].nil? && board[location].color != color
  end

  def current_row
    location.first
  end

  def current_column
    location.last
  end
end