class Board
  attr_accessor :grid
  
  def self.start_chess
    board = self.new
    8.times do |column|
      board[[1, column]] = Pawn.new(board, [1, column], :black)
      board[[6, column]] = Pawn.new(board, [6, column],:white)
    end
    [[0, :black], [7, :white]].each do |(row, color)|
      board[[row, 0]] = Rook.new(board, [row, 0], color)
      board[[row, 7]] = Rook.new(board, [row, 7], color)

      board[[row, 1]] = Knight.new(board, [row, 1], color)
      board[[row, 6]] = Knight.new(board, [row, 6], color)

      board[[row, 2]] = Bishop.new(board, [row, 2], color)
      board[[row, 5]] = Bishop.new(board, [row, 5], color)
    end
    board[[0, 3]] = King.new(board, [0, 3], :black)
    board[[0, 4]] = Queen.new(board, [0, 4], :black)

    board[[7, 3]] = King.new(board, [7, 3], :white)
    board[[7, 4]] = Queen.new(board, [7, 4], :white)

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

  def in_check?(color)
    king = pieces.find { |p| p.color == color && p.is_a?(King) }
      
    if king.nil?
      raise 'No king found.'
    end

    king_position = king.location
    
    pieces.select { |p| p.color != color }.each do |piece|
      if piece.available_moves.include?(king_position)
        return true
      end
    end
    
    false
  end

  def pieces
    grid.flatten.reject { |piece| piece.nil? }
  end

  def move_piece(start_position, end_position)
    piece = self[start_position]
    if !piece.available_moves.include?(end_position)
      raise InvalidMoveError.new("End position (#{end_position}) not in available moves: #{piece.available_moves}")
    end
    if !in_bounds?(end_position)
      raise InvalidMoveError.new('End position not in bounds')
    end

    self[start_position] = nil

    self[end_position] = piece

    piece.location = end_position
  end
end