require_relative './pawn.rb'
require_relative './rook.rb'
require_relative './knight.rb'
require_relative './bishop.rb'
require_relative './queen.rb'
require_relative './king.rb'

class Board
  attr_accessor :grid
  
  def self.start_chess
    board = self.new
    8.times do |column|
      board[[1, column]] = Pawn.new(:black)
      board[[6, column]] = Pawn.new(:white)
    end
    board[[0, 0]] = Rook.new(:black)
    board[[0, 7]] = Rook.new(:black)
    board[[7, 0]] = Rook.new(:white)
    board[[7, 7]] = Rook.new(:white)

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
end