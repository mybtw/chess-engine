class Queen
  attr_reader :color
  def initialize(color)
    @color = color
  end

  def to_s
    color == :black ? "♛" : "♕"
  end

  def move_dirs
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
      [1, 1],
      [-1, 1],
      [1, -1],
      [-1, -1]
    ]
  end
end