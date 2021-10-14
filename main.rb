require_relative './lib/board.rb'
require_relative './lib/board_renderer_text.rb'
require_relative './lib/pieces.rb'
require_relative './lib/player.rb'
require_relative './lib/game.rb'


# board = Board.new
# board[[2, 2]] = King.new(board, [2, 2], :black)
# p board[[2, 2]].available_moves

board = Board.start_chess
text_board = BoardRendererText.new(board)

board[[2, 2]] = Pawn.new(board, [2, 2], :white)
board[[2, 0]] = Pawn.new(board, [2, 0], :white)
p board[[1, 2]].available_moves

board.move_piece([1, 1], [4, 4])
puts text_board.render

# piece = board[[0, 0]]
# puts piece.enemy?([0, 1])
# puts piece.enemy?([0, 0])


# text_board = BoardRendererText.new(board)
# puts text_board.render