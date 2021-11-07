require_relative './lib/board.rb'
require_relative './lib/board_renderer_text.rb'
require_relative './lib/pieces.rb'
require_relative './lib/invalid_move_error.rb'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

board = Board.start_chess

game = Game.new(board, Player.new(:white), Player.new(:black), BoardRendererText)
game.play