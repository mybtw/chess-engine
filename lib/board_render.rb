class BoardRenderText
  attr_accessor :board
  def initialize(board)
    @board = board
  end

  def render
    8.times do |r|
        puts "--------------------"
        8.times do |c|
          piece = @board[[r,c]]
          print "#{piece} "
        end
        puts ""
    end
      puts "--------------------"
  end
end