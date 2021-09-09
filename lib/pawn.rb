class Pawn

  def initialize(location)
    @location = location
  end

  def move_directions
    [
      [0, 1]
    ]
  end

  def to_s
    "♟"
  end
  
  def row
    @location.first
  end

  def column
    @location.last
  end
end