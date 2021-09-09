class King
  attr_reader :color
  
  def initialize(color)
    @color = color
  end

  def move_directions
  end

  def to_s
    color == :black ? "♚" : "♔"
  end

end