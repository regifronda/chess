class King
  attr_reader :color
  
  def initialize(color)
    @color = color
  end

  def move_directions
    [[0, 1], [1, 1], [1, 0], [0, -1], [1, -1], [-1, 1], [-1, -1], [-1, 0]]
  end

  def to_s
    color == :black ? "♚" : "♔"
  end

end