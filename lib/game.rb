class Game
  attr_reader :player1, :player2
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
    puts "Select a piece: "
    start_position = current_player.get_position
    p start_position
    end

    puts "Select a position to move to:"
    end_position = current_player.get_position
    p end_position
  end
end