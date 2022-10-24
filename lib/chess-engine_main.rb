require_relative '../lib/pieces'
require_relative '../lib/board'
require_relative '../lib/board_render'


module ChessEngine
  # b = Board.new
  # b[[0,0]] = King.new(b, [0,0], :black)
  # p b[[0,0]].available_moves
  b = Board.start_chess
  text_board = BoardRenderText.new(b)
  puts text_board.render
end
