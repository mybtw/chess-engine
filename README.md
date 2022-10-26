# chess-engine in ruby

How to play the game?

Follow these steps:

b = Board.start_chess
g = Game.new(
 b,
 Player.new(:white),
 Player.new(:black),
 BoardRenderText
)
 g.play
 
 The console displays the state of the board every turn. Moves are taken in traditional chess notation. For example:
 input (Be2  Bg4) will move bishop from Be2 to Bg4


