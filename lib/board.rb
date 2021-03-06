class Board
  attr_accessor :grid
  
  def self.start_chess
    board = self.new
    8.times do |column|
      board[[1, column]] = Pawn.new(board, [1, column], :black)
      board[[6, column]] = Pawn.new(board, [6, column],:white)
    end

    [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |piece_klass, column|
      [[0, :black], [7, :white]].each do |(row, color)|
        location = [row, column]
        board[location] = piece_klass.new(
          board,
          location,
          color
        )
      end
    end
    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
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
    grid[row][column] == NullPiece.instance
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

  def checkmate?(color)
    return false if !in_check?(color)
    color_pieces = pieces.select { |p| p.color == color }
    color_pieces.any? { |piece| piece.safe_moves.empty? }
  end

  def pieces
    grid.flatten.reject { |piece| piece.is_a?(NullPiece) }
  end

  def move_piece(start_position, end_position)
    piece = self[start_position]

    if !piece.safe_moves.include?(end_position)
      raise InvalidMoveError.new("End position (#{end_position}) not in available moves: #{piece.safe_moves}")
    end
    if !in_bounds?(end_position)
      raise InvalidMoveError.new('End position not in bounds')
    end

    move_piece!(start_position, end_position)
  end

  def move_piece!(start_position, end_position)
    self[start_position], self[end_position] = NullPiece.instance, self[start_position]

    self[end_position].location = end_position
  end

  def dup
    new_board = Board.new
    pieces.each do |piece|
      new_piece = piece.class.new(new_board, piece.location, piece.color)
      new_board[new_piece.location] = new_piece
    end
    new_board
  end
end