require_relative '../lib/pieces'
require_relative '../lib/board'
require_relative '../lib/board_render'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/invalid_move_error'

#b = Board.start_chess
#g = Game.new(b, Player.new(:white), Player.new(:black), BoardRenderText)
#g.play
b = Board.new
b[[0,0]] = King.new(b, [0,0], :black)
b[[6,6]] = King.new(b, [6,6], :white)

b[[3,0]] = Rook.new(b, [3,0], :white)
b[[3,1]] = Rook.new(b, [3,1], :white)

puts b.in_check?(:black)
