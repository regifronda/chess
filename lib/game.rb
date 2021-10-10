class Game
  
  def initialize 
    @player1 = Player.new(:black)
    @player2 = Player.new(:white)
    @current_player = @player1
  end
end