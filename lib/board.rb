class Board
  attr_accessor :grid
  
  def self.start_chess
    board = self.new
    8.times do |column|
      board[[1, column]] = Pawn.new(self, [1, column], :black)
      board[[6, column]] = Pawn.new(self, [6, column],:white)
    end
    [[0, :black], [7, :white]].each do |(row, color)|
      board[[row, 0]] = Rook.new(self, [row, 0], color)
      board[[row, 7]] = Rook.new(self, [row, 7], color)

      board[[row, 1]] = Knight.new(self, [row, 1], color)
      board[[row, 6]] = Knight.new(self, [row, 6], color)

      board[[row, 2]] = Bishop.new(self, [row, 2], color)
      board[[row, 5]] = Bishop.new(self, [row, 5], color)
    end
    board[[0, 3]] = King.new(self, [0, 3], :black)
    board[[0, 4]] = Queen.new(self, [0, 4], :black)

    board[[7, 3]] = King.new(self, [7, 3], :white)
    board[[7, 4]] = Queen.new(self, [7, 4], :white)

    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  def [](location)
    row, column = location
    grid[row][column]
  end

  def in_bounds?(location)
    row, column = location

    row < grid.length && 
    column < grid.first.length &&
    row >= 0 &&
    column >= 0
  end

  def empty?(location)
    row, column = location
    grid[row][column].nil?
  end
end