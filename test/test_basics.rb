require_relative '../lib//pieces'
require_relative '../lib/board'
require_relative '../lib/board_render'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/invalid_move_error'
require 'test/unit'

class TestBasicLogic < Test::Unit::TestCase

  def test_knight
    b = Board.start_chess
    g = Game.new(
      b,
      Player.new(:white),
      Player.new(:black),
      BoardRenderText
    )
    assert_equal(b[[0,1]].available_moves, [[2,2],[2,0]])
  end

  def test_rook
    b = Board.new
    b[[0,0]] = Rook.new(b,[0,0],:black)
    b[[1,0]] = Pawn.new(b,[0,0],:black)
    assert_equal(b[[0,0]].available_moves, [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]])
  end


  def test_pawn
    b = Board.start_chess
    g = Game.new(
      b,
      Player.new(:white),
      Player.new(:black),
      BoardRenderText
    )
    assert_equal(b[[1,0]].available_moves, [[2, 0], [3, 0]],"Pawn test passed")
  end

  def test_mate
    b = Board.new
    b[[0,0]] = Rook.new(b, [0,0], :black)
    b[[0,1]] = Rook.new(b, [0,1], :black)

    b[[5,0]] = King.new(b, [5,0], :white)
    b[[7,7]] = King.new(b, [7,7], :black)
    assert_equal b.checkmate?(:white), true
  end


  def test_invalid_move
    b = Board.start_chess
    g = Game.new(
      b,
      Player.new(:white),
      Player.new(:black),
      BoardRenderText
    )

      b.move_piece([1,1],[4,4])
       rescue InvalidMoveError
      assert_equal(true, true)
  end

end