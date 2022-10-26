require_relative '../lib//pieces'
require_relative '../lib/board'
require_relative '../lib/board_render'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/invalid_move_error'

b = Board.start_chess
g = Game.new(
  b,
  Player.new(:white),
  Player.new(:black),
  BoardRenderText
)
g.play


# 1. e4 e5 2. Qh5?! Nc6 3. Bc4 Nf6?? 4. Qxf7# – это запись в английской нотации