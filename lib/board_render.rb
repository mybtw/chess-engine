class BoardRenderText
  def initialize(board)
    @board = board
  end
  def render
    8.times do |r|
        puts "---------------"
        8.times do |c|
          piece = board[[r,c]]
          if piece.nil?
            print "  "
          else
           print "#{piece} "
          end
        end
         puts ""
    end
      puts "---------------"
  end
end