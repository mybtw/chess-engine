class Player
  attr_reader :color
  def initialize(color)
    @color = color
  end

  # начальные и конечные [x,y,x1,y1]
  def get_pos
    input = gets.chomp
    if(!input.match('[KQRBN]?[a-h]?[1-8]?x?[a-h][1-8]'))
      raise InvalidMoveError.new('Invalid move')
    end
    if(input.length == 2)
      return [8-input[1].to_i,input[0].ord - 97]
    end
    if(input.length == 3)
      return [8 -input[2].to_i,input[1].ord - 97]
    end





  end
end

