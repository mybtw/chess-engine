require_relative './pawn.rb'
require_relative './queen.rb'
require_relative './rook.rb'
class Board
  attr_reader :grid
  def self.start_chess
    board = self.new
    8.times do |c|
      board[[1, c]] = Pawn.new(board, [1,c], :black)
      board[[6, c]] = Pawn.new(board, [6,c], :white)
    end
    [[0, :black], [7, :white]].each do |(r, color)|
      board[[r, 0]] = Rook.new(board, [r, 0],:color)
      board[[r, 7]] = Rook.new(board, [r, 7], :color)
      board[[r, 1]] = Knight.new(board, [r, 1],:color)
      board[[r, 6]] = Knight.new(board, [r, 6],:color)
      board[[r, 2]] = Bishop.new(board, [r, 2],:color)
      board[[r, 5]] = Bishop.new(board, [r, 5],:color)
    end
    board[[0, 3]] = King.new(board, [0, 3], :black)
    board[[0, 4]] = Queen.new(board, [0, 4], :black)
    board[[7, 3]] = King.new(board, [7, 3], :white)
    board[[7, 4]] = Queen.new(board, [7, 4], :white)
    board
  end
  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  def [](location)
    row, column = location
    grid[row][column]
  end

  def in_bounds?(location)
    row, column = location
    row < grid.length && column < grid.first.length && row >= 0 && column >= 0
  end

  def empty?(location)
    row, column = location
    grid[row][column].nil?
  end
end