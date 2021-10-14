class Game
  attr_reader :player1, :player2
  attr_accessor :current_player

  def initialize 
    @player1 = Player.new(:black)
    @player2 = Player.new(:white)
    @current_player = @player1
  end
end