# chess-engine in ruby

How to play the game?

Follow these steps:

b = Board.start_chess __
g = Game.new( __
 b,
 Player.new(:white), __
 Player.new(:black),  __
 BoardRenderText   __
) __
 g.play __
 
 The console displays the state of the board every turn. Moves are taken in traditional chess notation. For example:
 input (Be2  Bg4) will move bishop from Be2 to Bg4


