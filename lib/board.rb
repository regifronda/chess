class Board
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end


  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  def render
    puts
    @grid.each do |row|
      row.each do |cell|
      cell.nil? ? print("-") : print(cell.to_s)
      end
      puts
    end
    puts
  end
end