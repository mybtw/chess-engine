module Slidebale
  def available_moves
    moves = []
    move_dirs.each do |(dr, dc)|
      current_r, current_c = location
      loop do
        current_r += dr
        current_c += dc
        loc = [current_r, current_c]
        break if !board.in_bounds?(loc)
        break if alias?(loc)
        if board.empty?(loc)
          moves << loc
          next
        end
        if enemy?(loc)
          moves << loc
          break
        end
      end
    end
    moves
  end
end
