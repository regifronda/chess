class Game
  attr_reader :player1, :player2, :board
  attr_accessor :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    puts "It's #{current_player.color}'s turn"
    
    loop do
    puts "Select a piece to move: "
    start_position = current_player.get_position
    if board[start_position].color == current_player.color
      break
    end
    puts "Did not select a #{current_player.color} piece"
    p start_position
    end

    puts "Select a position to move to:"
    end_position = current_player.get_position
    p end_position
  end
end