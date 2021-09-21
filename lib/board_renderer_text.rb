class BoardRendererText
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    8.times do |row|
      puts "--------------------"
      8.times do |column|
        print "#{board[[row, column]]} "
      end
      puts ""
    end
  end
end